import path from 'path';
import { fileURLToPath } from 'url';
import dotenv from 'dotenv';
import { app } from './backend/app.ts';
import { Request, Response } from 'express';

dotenv.config();

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const isProduction = process.env.NODE_ENV === 'production';
const PORT = parseInt(process.env.PORT || '3000', 10);

async function startServer() {
  // Development vs Production frontend serving
  if (!isProduction) {
    const { createServer: createViteServer } = await import('vite');
    const vite = await createViteServer({
      server: {
        middlewareMode: true,
        hmr: false,
        watch: null
      },
      appType: 'spa'
    });
    app.use(vite.middlewares);
    console.log('⚡ Vite dev middleware mounted.');
  } else {
    const distPath = path.resolve(__dirname, 'dist');
    const express = (await import('express')).default;
    app.use(express.static(distPath));
    app.get('*', (_req: Request, res: Response) => {
      res.sendFile(path.join(distPath, 'index.html'));
    });
    console.log(`📦 Serving static files from ${distPath}`);
  }

  app.listen(PORT, '0.0.0.0', () => {
    console.log(`🚀 CampusConnect server running at http://localhost:${PORT}`);
  });
}

startServer().catch((err) => {
  console.error('Fatal error starting CampusConnect server:', err);
  process.exit(1);
});
