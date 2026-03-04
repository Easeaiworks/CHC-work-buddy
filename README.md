# BodyShop AI Assistant

Enterprise-grade AI assistant for body shop technicians. Voice-activated, multilingual (EN/FR/ES), with RAG-powered document retrieval, training videos, SDS sheets, and full workflow management.

---

## Quick Start

### Prerequisites
- Node.js 20+
- Supabase project (free tier works)
- Railway account
- Anthropic API key
- OpenAI API key (for embeddings)
- GitHub account

---

## Setup: Step by Step

### 1. Clone & Configure

```bash
git clone https://github.com/YOUR_ORG/bodyshop-ai.git
cd bodyshop-ai
cp .env.example backend/.env
cp .env.example frontend/.env
```

Edit both `.env` files with your credentials.

### 2. Set Up Supabase

1. Create new Supabase project at https://supabase.com
2. Go to **SQL Editor** and run `database/schema.sql`
3. Go to **Storage** → Create two buckets:
   - `bodyshop-docs` (public)
   - `bodyshop-media` (public)
4. Copy your **Project URL** and **API keys** to `.env`

### 3. Install & Run Locally

```bash
# Backend
cd backend && npm install && npm run dev

# Frontend (new terminal)
cd frontend && npm install && npm run dev
```

Frontend: http://localhost:5173
Backend: http://localhost:3001

### 4. Deploy to Railway

1. Push to GitHub main branch
2. In Railway: **New Project** → **Deploy from GitHub repo**
3. Create two services: `backend` (from `./backend`) and `frontend` (from `./frontend`)
4. Add environment variables from `.env.example` in Railway dashboard
5. Set `ALLOWED_ORIGINS` to your Railway frontend URL

### 5. Share the App

Users can install the PWA by:
- Visiting your Railway URL on mobile → "Add to Home Screen"
- Or on desktop Chrome → install icon in address bar

Share the URL: `https://YOUR-FRONTEND.railway.app`

---

## Admin: Uploading Documents

1. Log in with an admin account
2. Use the API: `POST /api/ingest/document` with multipart form data:
   - `file`: PDF, DOCX, or TXT
   - `title`: Document title
   - `docType`: `sds`, `tech_sheet`, `manual`, `procedure`, `checklist`
   - `tabSlug`: `prep`, `primer-paint`, etc.
   - `language`: `en`, `fr`, `es`

Or build the Admin UI (Phase 2) for drag-and-drop uploads.

---

## Architecture

See `docs/ARCHITECTURE.md` for full system diagram and security details.

---

## Security

- JWT auth via Supabase
- Row-Level Security on all tables
- Rate limiting (100 req/min general, 30/min AI)
- CORS whitelist
- Helmet.js security headers
- Full audit trail in `audit_log` table
- Encrypted at rest (Supabase), TLS in transit

---

## Voice Commands

Max supports natural language in English, French, and Spanish:

- "Show me the SDS for PPG Deltron primer"
- "What's the mixing ratio for base coat?"  
- "How do I prep plastic bumpers?"
- "Montre-moi la procédure de ponçage"
- "¿Cuál es el ratio de mezcla para el barniz?"

---

## Scaling to 1000 Users

- Railway: Enable auto-scaling (2+ instances)
- Supabase: Connection pooling enabled by default
- Vector search: HNSW index handles thousands of concurrent queries
- Media: Served from Supabase CDN, not your server

---

## Support

Open an issue on GitHub or contact your system administrator.
