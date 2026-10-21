import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { DatabaseSchema, UserStats, UserProfileResponse, User, Gig, Application, Review } from './types.ts';
import { getInitialSeedData } from './seedData.ts';

import { supabase, isSupabaseServerConfigured } from './supabase.ts';
import { runSupabaseSeed } from './seedSupabase.ts';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const DATA_DIR = path.join(__dirname, 'data');
const DB_FILE = path.join(DATA_DIR, 'db.json');
const TMP_FILE = path.join(DATA_DIR, 'db.json.tmp');

class DatabaseStore {
  private queue: Promise<any> = Promise.resolve();
  private inMemoryData: DatabaseSchema | null = null;
  private supabaseSynced: boolean = false;

  constructor() {
    this.ensureInitialized();
  }

  public isSupabaseActive(): boolean {
    return isSupabaseServerConfigured();
  }

  public ensureInitialized(): void {
    try {
      if (!fs.existsSync(DATA_DIR)) {
        fs.mkdirSync(DATA_DIR, { recursive: true });
      }
      if (!fs.existsSync(DB_FILE)) {
        const initial = getInitialSeedData();
        fs.writeFileSync(DB_FILE, JSON.stringify(initial, null, 2), 'utf-8');
        this.inMemoryData = initial;
      } else {
        try {
          const content = fs.readFileSync(DB_FILE, 'utf-8');
          const parsed = JSON.parse(content) as DatabaseSchema;
          if (!parsed.saved_gigs) parsed.saved_gigs = [];
          if (!parsed.notifications) parsed.notifications = [];
          this.inMemoryData = parsed;
        } catch (err) {
          console.error('Failed to parse existing db.json, reseeding:', err);
          const initial = getInitialSeedData();
          try {
            fs.writeFileSync(DB_FILE, JSON.stringify(initial, null, 2), 'utf-8');
          } catch {}
          this.inMemoryData = initial;
        }
      }
    } catch {
      // In serverless environments where local filesystem is read-only
      if (!this.inMemoryData) {
        this.inMemoryData = getInitialSeedData();
      }
    }

    if (this.inMemoryData) {
      if (!this.inMemoryData.saved_gigs) this.inMemoryData.saved_gigs = [];
      if (!this.inMemoryData.notifications) this.inMemoryData.notifications = [];
    }
    this.evaluateExpirationsSync();
  }

  public async syncWithSupabase(): Promise<void> {
    if (!this.isSupabaseActive()) return;
    try {
      const client = supabase.client;
      const [uRes, gRes, aRes, rRes, sRes, nRes] = await Promise.all([
        client.from('users').select('*').order('id', { ascending: true }),
        client.from('gigs').select('*').order('id', { ascending: true }),
        client.from('applications').select('*').order('id', { ascending: true }),
        client.from('reviews').select('*').order('id', { ascending: true }),
        client.from('saved_gigs').select('*').order('id', { ascending: true }),
        client.from('notifications').select('*').order('id', { ascending: true })
      ]);

      if (uRes.error) {
        console.warn('Supabase fetch error, maintaining in-memory cache:', uRes.error.message);
        return;
      }

      if (!uRes.data || uRes.data.length === 0) {
        await runSupabaseSeed();
        return this.syncWithSupabase();
      }

      this.inMemoryData = {
        users: (uRes.data || []) as User[],
        gigs: (gRes.data || []) as Gig[],
        applications: (aRes.data || []) as Application[],
        reviews: (rRes.data || []) as Review[],
        saved_gigs: sRes.data || [],
        notifications: nRes.data || []
      };
      this.supabaseSynced = true;
    } catch (err: any) {
      console.warn('Supabase synchronization warning:', err.message);
    }
  }

  public addNotificationSync(db: DatabaseSchema, notification: {
    user_id: number;
    type: 'application_received' | 'application_accepted' | 'application_rejected' | 'gig_completed' | 'review_received';
    title: string;
    message: string;
    gig_id?: number;
    link?: string;
  }) {
    if (!db.notifications) db.notifications = [];
    const maxId = db.notifications.reduce((max, n) => (n.id > max ? n.id : max), 0);
    const newNotif = {
      id: Math.max(maxId + 1, 601),
      user_id: notification.user_id,
      type: notification.type,
      title: notification.title,
      message: notification.message,
      gig_id: notification.gig_id,
      link: notification.link,
      read: false,
      created_at: new Date().toISOString()
    };
    db.notifications.unshift(newNotif);
    return newNotif;
  }

  public async resetToSeed(): Promise<DatabaseSchema> {
    return this.runExclusive(async () => {
      const seed = getInitialSeedData();
      this.inMemoryData = seed;

      if (this.isSupabaseActive()) {
        try {
          await runSupabaseSeed();
        } catch (err: any) {
          console.warn('Failed to reseed Supabase directly:', err.message);
        }
      }

      await this.persist();
      return this.inMemoryData;
    });
  }

  private evaluateExpirationsSync(): boolean {
    if (!this.inMemoryData) return false;
    let changed = false;
    const now = Date.now();
    for (const gig of this.inMemoryData.gigs) {
      if (gig.status === 'Open') {
        const deadlineTime = new Date(gig.deadline).getTime();
        if (deadlineTime < now) {
          gig.status = 'Expired';
          changed = true;
        }
      }
    }
    return changed;
  }

  private async persist(): Promise<void> {
    if (!this.inMemoryData) return;

    if (this.isSupabaseActive()) {
      try {
        const client = supabase.client;
        if (this.inMemoryData.users.length > 0) {
          await client.from('users').upsert(
            this.inMemoryData.users.map((u) => ({
              id: u.id,
              auth_user_id: u.auth_user_id || null,
              email: u.email,
              name: u.name,
              major: u.major,
              semester: u.semester,
              bio: u.bio,
              skills: u.skills
            })),
            { onConflict: 'id' }
          );
        }
        if (this.inMemoryData.gigs.length > 0) {
          await client.from('gigs').upsert(
            this.inMemoryData.gigs.map((g) => ({
              id: g.id,
              user_id: g.user_id,
              title: g.title,
              description: g.description,
              type: g.type,
              category: g.category,
              payment_type: g.payment_type,
              budget: g.budget,
              deadline: g.deadline,
              status: g.status,
              accepted_applicant_id: g.accepted_applicant_id || null,
              created_at: g.created_at
            })),
            { onConflict: 'id' }
          );
        }
        if (this.inMemoryData.applications.length > 0) {
          await client.from('applications').upsert(
            this.inMemoryData.applications.map((a) => ({
              id: a.id,
              gig_id: a.gig_id,
              applicant_id: a.applicant_id,
              message: a.message,
              status: a.status,
              created_at: a.created_at
            })),
            { onConflict: 'id' }
          );
        }
        if (this.inMemoryData.reviews.length > 0) {
          await client.from('reviews').upsert(
            this.inMemoryData.reviews.map((r) => ({
              id: r.id,
              gig_id: r.gig_id,
              reviewer_id: r.reviewer_id,
              reviewee_id: r.reviewee_id,
              rating: r.rating,
              comment: r.comment
            })),
            { onConflict: 'id' }
          );
        }
      } catch (sbErr: any) {
        console.warn('Supabase persistence error:', sbErr.message);
      }
    }

    try {
      const jsonStr = JSON.stringify(this.inMemoryData, null, 2);
      await fs.promises.writeFile(TMP_FILE, jsonStr, 'utf-8');
      await fs.promises.rename(TMP_FILE, DB_FILE);
    } catch {
      try {
        const jsonStr = JSON.stringify(this.inMemoryData, null, 2);
        await fs.promises.writeFile('/tmp/campusconnect_db.json', jsonStr, 'utf-8');
      } catch {
        // Fallback in-memory
      }
    }
  }

  public async runExclusive<T>(operation: (db: DatabaseSchema) => Promise<T> | T): Promise<T> {
    const nextInQueue = this.queue.then(async () => {
      if (!this.inMemoryData) {
        this.ensureInitialized();
      }
      if (this.isSupabaseActive() && !this.supabaseSynced) {
        await this.syncWithSupabase();
      }
      const expiredChanged = this.evaluateExpirationsSync();
      const result = await operation(this.inMemoryData!);
      if (expiredChanged || true) {
        await this.persist();
      }
      return result;
    });

    this.queue = nextInQueue.catch((err) => {
      console.error('Database transaction error:', err);
    });

    return nextInQueue;
  }

  public async readData(): Promise<DatabaseSchema> {
    return this.runExclusive((db) => {
      return JSON.parse(JSON.stringify(db));
    });
  }

  public calculateUserStats(userId: number, db: DatabaseSchema): UserStats {
    const gigsPosted = db.gigs.filter((g) => g.user_id === userId).length;

    // A gig is completed if status === 'Completed' and user is either owner or accepted applicant
    const completedGigs = db.gigs.filter((g) => {
      if (g.status !== 'Completed') return false;
      if (g.user_id === userId) return true;
      if (g.accepted_applicant_id) {
        const app = db.applications.find((a) => a.id === g.accepted_applicant_id);
        if (app && app.applicant_id === userId) return true;
      }
      return false;
    });
    const gigsCompleted = completedGigs.length;

    // Reviews received by this user
    const receivedReviews = db.reviews.filter((r) => r.reviewee_id === userId);
    let avgRating: number | null = null;
    if (receivedReviews.length > 0) {
      const sum = receivedReviews.reduce((acc, r) => acc + r.rating, 0);
      avgRating = Math.round((sum / receivedReviews.length) * 100) / 100;
    }

    return {
      gigs_posted: gigsPosted,
      gigs_completed: gigsCompleted,
      average_rating: avgRating,
      ratings_count: receivedReviews.length
    };
  }

  public async getUserProfile(userId: number): Promise<UserProfileResponse | null> {
    return this.runExclusive((db) => {
      const user = db.users.find((u) => u.id === userId);
      if (!user) return null;
      const stats = this.calculateUserStats(userId, db);
      return {
        ...user,
        password: undefined,
        password_salt: undefined,
        stats
      };
    });
  }
}

export const dbStore = new DatabaseStore();
