import express, { Express, Request, Response, NextFunction } from 'express';
import dotenv from 'dotenv';
import { usersRouter } from './routes/users.ts';
import { gigsRouter } from './routes/gigs.ts';
import { applicationsRouter } from './routes/applications.ts';
import { reviewsRouter } from './routes/reviews.ts';
import { seedRouter } from './routes/seed.ts';
import { authRouter } from './routes/auth.ts';
import { dbStore } from './store.ts';

dotenv.config();

export function createCampusConnectApp(): Express {
  const app: Express = express();

  // Standard middleware
  app.use(express.json());
  app.use(express.urlencoded({ extended: true }));

  // CORS and security headers for API requests
  app.use((req: Request, res: Response, next: NextFunction) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, PATCH, DELETE, OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization, X-Requested-With, X-Admin-Key');
    if (req.method === 'OPTIONS') {
      return res.status(200).end();
    }
    next();
  });

  // Ensure DB initialized / evaluation
  dbStore.ensureInitialized();

  // Health check endpoint
  const healthHandler = (_req: Request, res: Response) => {
    res.status(200).json({
      status: 'ok',
      service: 'CampusConnect API',
      environment: process.env.NODE_ENV || 'development',
      timestamp: new Date().toISOString()
    });
  };

  app.get('/api/health', healthHandler);
  app.get('/health', healthHandler);
  app.get('/api', healthHandler);

  // Mount API routers both with and without /api prefix
  // Guarantees compatibility whether Vercel preserves or strips the /api prefix
  const mountRoutes = (prefix: string) => {
    app.use(`${prefix}/users`, usersRouter);
    app.use(`${prefix}/gigs`, gigsRouter);
    app.use(`${prefix}/applications`, applicationsRouter);
    app.use(`${prefix}/reviews`, reviewsRouter);
    app.use(`${prefix}/seed`, seedRouter);
    app.use(`${prefix}/auth`, authRouter);
  };

  mountRoutes('/api');
  mountRoutes('');

  // 404 handler for unmatched API routes
  app.use('/api/*', (_req: Request, res: Response) => {
    res.status(404).json({
      success: false,
      error: {
        code: 'NOT_FOUND',
        message: 'The requested API endpoint was not found on this server.'
      }
    });
  });

  // Global error handler
  app.use((err: any, _req: Request, res: Response, _next: NextFunction) => {
    console.error('API Error:', err);
    res.status(err.status || 500).json({
      success: false,
      error: {
        code: err.code || 'INTERNAL_SERVER_ERROR',
        message: err.message || 'An unexpected server error occurred.'
      }
    });
  });

  return app;
}

export const app = createCampusConnectApp();
export default app;
