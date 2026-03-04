# BodyShop AI Assistant — Architecture & Project Outline

## Project Overview
An enterprise-grade AI assistant for body shop employees featuring voice interaction, RAG-based document retrieval, multilingual support (EN/FR/ES), and a full workflow management interface.

---

## Tech Stack

| Layer | Technology | Purpose |
|---|---|---|
| Frontend | React 18 + Vite (PWA) | UI, voice, avatar |
| Backend | Node.js + Express | API, agent orchestration |
| Database | Supabase (PostgreSQL + pgvector) | Data + vector search |
| AI Agent | Anthropic Claude API | Intelligence layer |
| Embeddings | OpenAI text-embedding-3-small | Vector generation |
| Storage | Supabase Storage | Videos, PDFs, slideshows |
| CI/CD | GitHub Actions → Railway | Auto-deploy |
| Auth | Supabase Auth (JWT) | User management |
| TTS | Web Speech API + ElevenLabs (optional) | Avatar voice |

---

## Repository Structure

```
bodyshop-ai/
├── frontend/               # React PWA
│   ├── public/
│   │   ├── manifest.json   # PWA manifest
│   │   └── sw.js           # Service worker
│   ├── src/
│   │   ├── components/
│   │   │   ├── Avatar/         # Animated avatar + TTS
│   │   │   ├── VoiceInput/     # Speech recognition
│   │   │   ├── SearchBar/      # Global search
│   │   │   ├── TabNav/         # 7-tab navigation
│   │   │   ├── MediaViewer/    # Video / Slideshow / PDF
│   │   │   ├── DocumentCard/   # SDS / Tech sheets
│   │   │   ├── ChatPanel/      # AI conversation
│   │   │   └── Admin/          # Admin dashboard
│   │   ├── hooks/
│   │   │   ├── useVoice.js     # STT/TTS hook
│   │   │   ├── useSearch.js    # Global search hook
│   │   │   └── useAgent.js     # AI agent hook
│   │   ├── services/
│   │   │   ├── api.js          # Backend API client
│   │   │   ├── supabase.js     # Supabase client
│   │   │   └── voice.js        # Speech services
│   │   ├── store/
│   │   │   └── appStore.js     # Zustand state
│   │   └── App.jsx
│   ├── package.json
│   └── vite.config.js
│
├── backend/                # Express API Server
│   ├── src/
│   │   ├── routes/
│   │   │   ├── agent.js        # AI agent endpoints
│   │   │   ├── documents.js    # RAG document endpoints
│   │   │   ├── media.js        # Video/slideshow endpoints
│   │   │   ├── search.js       # Vector search
│   │   │   ├── ingest.js       # Document upload + embed
│   │   │   └── auth.js         # Auth middleware
│   │   ├── middleware/
│   │   │   ├── auth.js         # JWT validation
│   │   │   ├── rateLimit.js    # Rate limiting (1000 users)
│   │   │   └── security.js     # Helmet, CORS, CSP
│   │   ├── services/
│   │   │   ├── anthropic.js    # Claude agent service
│   │   │   ├── embeddings.js   # Embedding generation
│   │   │   ├── rag.js          # RAG pipeline
│   │   │   └── storage.js      # Supabase storage
│   │   └── index.js
│   ├── package.json
│   └── Dockerfile
│
├── database/
│   ├── schema.sql          # Full DB schema with pgvector
│   ├── seed.sql            # Sample data
│   └── migrations/
│
├── .github/
│   └── workflows/
│       └── deploy.yml      # CI/CD pipeline
│
├── docker-compose.yml
└── README.md
```

---

## Database Schema (Supabase + pgvector)

### Core Tables
- **users** — Auth users, roles (admin/employee), language preference
- **documents** — SDS sheets, tech specs, manuals (with vector embeddings)
- **media_items** — Videos, slideshows, linked to workflow tabs
- **chat_sessions** — Conversation history per user
- **chat_messages** — Individual messages in sessions
- **workflow_tabs** — Tab definitions and associated content
- **document_chunks** — Chunked documents with vector embeddings
- **search_index** — Full-text search index

### Vector Search
- pgvector extension enabled
- 1536-dimension vectors (OpenAI) or 1024 (Voyage)
- HNSW index for fast approximate nearest neighbor search
- Similarity threshold: 0.7

---

## AI Agent Architecture

```
User Voice/Text Input
        ↓
  Language Detection
        ↓
  Intent Classification
  ┌─────┴─────┐
  │           │
General    Document
  Q&A       Search
  │           │
  │    Vector Search (pgvector)
  │           │
  └─────┬─────┘
        ↓
  Context Assembly (RAG)
        ↓
  Claude claude-sonnet-4-20250514 (Agent)
        ↓
  Response + Source Citations
        ↓
  TTS (Avatar Speaks)
```

### Agent System Prompt Pillars
1. Body shop domain expert (collision repair, refinishing)
2. Safety-first (always flag PPE/SDS concerns)
3. Bilingual/trilingual (auto-detect or user-set)
4. Source citations (always reference document)

---

## Voice Interaction Flow
1. User presses mic button or says wake word
2. Web Speech API captures audio → transcript
3. Text sent to `/api/agent/query`
4. Backend: detect language → RAG search → Claude response
5. Response streamed back
6. TTS speaks response (avatar animates)
7. Sources shown as cards below

---

## Security Architecture (Enterprise Grade)

| Concern | Solution |
|---|---|
| Auth | Supabase JWT + RLS (Row Level Security) |
| API | Rate limiting (100 req/min/user), API key rotation |
| Transport | HTTPS only, HSTS headers |
| Data | Encrypted at rest (Supabase), in transit (TLS 1.3) |
| Input | Server-side sanitization, prompt injection guards |
| CORS | Whitelist-only origins |
| Secrets | Railway env vars, never in code |
| Audit | Full request logging, user action audit trail |
| CSP | Content Security Policy headers |

---

## PWA / Distribution
- `manifest.json` with app icons, name, theme
- Service worker for offline caching of static assets
- "Add to Home Screen" prompt
- Shareable install link: `https://bodyshop-ai.railway.app`
- Works on iOS Safari, Android Chrome, Desktop Chrome/Edge

---

## Scalability Plan (1000 Users)

| Component | Strategy |
|---|---|
| Railway | Auto-scale, 2+ instances |
| Supabase | Connection pooling (PgBouncer) |
| Vector Search | HNSW index (sub-10ms at scale) |
| CDN | Supabase Storage CDN for media |
| Caching | Redis on Railway for frequent queries |
| Rate Limits | Per-user token bucket |

---

## Workflow Tabs — Content Mapping

| Tab | Content Types |
|---|---|
| Admin/Intake | Job cards, customer intake forms, estimate docs |
| Disassemble | Removal procedures, parts diagrams, videos |
| Prep | Surface prep guides, SDS sheets, tech ratios |
| Body Work | Repair procedures, filler tech sheets, videos |
| Primer & Paint | Mixing ratios, SDS, spray technique guides |
| Detailing | Polish/compound specs, final inspection checklists |
| Hand Back | QC checklists, delivery procedures, warranty info |

---

## Phase 1 Deliverables (This Build)
- [x] Full frontend React PWA with all tabs + voice + avatar
- [x] Backend Express API with RAG endpoints
- [x] Supabase schema with pgvector
- [x] Auth system
- [x] Admin document upload interface
- [x] CI/CD GitHub Actions → Railway

## Phase 2 (Post-Launch)
- [ ] ElevenLabs voice cloning for avatar
- [ ] 3D avatar lip sync
- [ ] Mobile push notifications
- [ ] Offline mode with local LLM fallback
- [ ] Analytics dashboard
