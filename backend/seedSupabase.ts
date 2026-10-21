import dotenv from 'dotenv';
import { supabase, isSupabaseServerConfigured } from './supabase.ts';
import { getInitialSeedData } from './seedData.ts';

dotenv.config();

export async function runSupabaseSeed() {
  if (!isSupabaseServerConfigured()) {
    throw new Error(
      'Cannot seed Supabase: SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY are not configured in environment.'
    );
  }

  const client = supabase.client;
  const seed = getInitialSeedData();

  console.log('🚀 Seeding Supabase PostgreSQL database...');

  // 1. Seed Users
  console.log(`👤 Seeding ${seed.users.length} student users...`);
  for (const u of seed.users) {
    const { error } = await client.from('users').upsert({
      id: u.id,
      email: u.email,
      name: u.name,
      major: u.major,
      semester: u.semester,
      bio: u.bio,
      skills: u.skills
    }, { onConflict: 'id' });

    if (error) {
      console.warn(`  ⚠️ Failed to upsert user ${u.name}:`, error.message);
    }
  }

  // 2. Seed Gigs (without accepted_applicant_id first)
  console.log(`📋 Seeding ${seed.gigs.length} gigs...`);
  for (const g of seed.gigs) {
    const { error } = await client.from('gigs').upsert({
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
      created_at: g.created_at
    }, { onConflict: 'id' });

    if (error) {
      console.warn(`  ⚠️ Failed to upsert gig ${g.title}:`, error.message);
    }
  }

  // 3. Seed Applications
  console.log(`📩 Seeding ${seed.applications.length} applications...`);
  for (const a of seed.applications) {
    const { error } = await client.from('applications').upsert({
      id: a.id,
      gig_id: a.gig_id,
      applicant_id: a.applicant_id,
      message: a.message,
      status: a.status,
      created_at: a.created_at
    }, { onConflict: 'id' });

    if (error) {
      console.warn(`  ⚠️ Failed to upsert application #${a.id}:`, error.message);
    }
  }

  // 4. Update Gigs with accepted_applicant_id
  for (const g of seed.gigs) {
    if (g.accepted_applicant_id) {
      await client.from('gigs').update({
        accepted_applicant_id: g.accepted_applicant_id
      }).eq('id', g.id);
    }
  }

  // 5. Seed Reviews
  console.log(`⭐ Seeding ${seed.reviews.length} reviews...`);
  for (const r of seed.reviews) {
    const { error } = await client.from('reviews').upsert({
      id: r.id,
      gig_id: r.gig_id,
      reviewer_id: r.reviewer_id,
      reviewee_id: r.reviewee_id,
      rating: r.rating,
      comment: r.comment
    }, { onConflict: 'id' });

    if (error) {
      console.warn(`  ⚠️ Failed to upsert review #${r.id}:`, error.message);
    }
  }

  console.log('✅ Supabase PostgreSQL seeding complete!');
  return {
    usersCount: seed.users.length,
    gigsCount: seed.gigs.length,
    applicationsCount: seed.applications.length,
    reviewsCount: seed.reviews.length
  };
}

// Direct execution CLI runner
if (process.argv[1]?.endsWith('seedSupabase.ts')) {
  runSupabaseSeed()
    .then((res) => {
      console.log('Result:', res);
      process.exit(0);
    })
    .catch((err) => {
      console.error('❌ Seeding failed:', err.message);
      process.exit(1);
    });
}
