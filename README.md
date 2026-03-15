# Arcadia Zoo Management V2

Professional rebuild of the Arcadia Zoo Management System, originally built as a student project in procedural PHP (V1). This version demonstrates modern full-stack development with the same features, same database relationships, and same visual identity — but with proper architecture.

## Why This Stack

| Choice | Reasoning |
|--------|-----------|
| **Next.js 15 (App Router)** | Server components for fast initial loads, API routes for backend logic, file-based routing. The developer's primary stack — demonstrates real proficiency, not tutorial-level familiarity. |
| **TypeScript** | Type safety across the full stack. Catches bugs at build time that V1's PHP caught at runtime (or didn't). |
| **Supabase (PostgreSQL)** | Drop-in replacement for MySQL + MongoDB. Free tier includes PostgreSQL, auth, storage, and real-time — everything the app needs. Eliminates the MongoDB sprawl from V1. |
| **Tailwind CSS** | Replaces Bootstrap 4 + custom CSS. Utility-first approach means no dead CSS, no specificity wars. Keeps the same green zoo theme (`#006400`, `#3b6e47`). |
| **bcryptjs** | Proper password hashing. V1 stored passwords in plaintext — this was the #1 security fix. |

**Why not Laravel/Slim?** The developer's strongest stack is Next.js/TypeScript. A portfolio project should showcase your best work, not a framework you're learning. Next.js also deploys to Vercel for free with zero config.

## What Changed from V1

### Architecture
- **V1:** 30+ procedural PHP files mixing SQL, logic, and HTML in every file
- **V2:** Next.js App Router with separated API routes, server components, and client components

### Security
- **Passwords:** Plaintext → bcrypt hashing
- **Auth:** Broken `$_SESSION['role']` (never set) → Working cookie-based sessions with role middleware
- **Authorization:** Many pages had no auth checks → Every dashboard route requires authentication + role verification
- **SQL Injection:** Fixed (`_statistics.php` had raw interpolation) → All queries via Supabase client (parameterized)
- **Credentials:** Hardcoded in `config2.php` → Environment variables via `.env`

### Database
- **V1:** MySQL (10 tables) + MongoDB (3 competing databases, 4 collections)
- **V2:** Supabase/PostgreSQL (13 tables) — same 10 original tables + `contact_submissions`, `contact_info`, `animal_clicks`
- MongoDB sprawl eliminated: single `animal_clicks` table replaces `zoo_database.clicks`, `zoo_database.animal_stats`, `zoo.animal_statistics`, and `animal_tracking.statistics`

### Features Preserved
All V1 features are present:
- Public: homepage, animal browsing by habitat, animal details, services, bookings, contact form, about page
- Admin: full CRUD for animals, users, services, review moderation, vet reports, analytics dashboard
- Employee: feeding log management, review moderation
- Vet: veterinary report submission and viewing
- Analytics: animal click tracking (one clean implementation)

### Code Quality
- **V1:** No framework, duplicate files (`mng_reviews.php`/`mngreview.php`, `animal_zone.php`/`nosql/json.php`), dead links, syntax errors
- **V2:** Zero duplicate files, typed interfaces for all data models, consistent patterns

## Database Schema

13 tables in Supabase (PostgreSQL):

| Table | Purpose | V1 Equivalent |
|-------|---------|---------------|
| `users` | User accounts with bcrypt passwords | `users` |
| `user_role_assignments` | Role mapping (admin/vet/emp) | `user_role_assignments` |
| `habitats` | Zoo habitats | `habitats` |
| `animals` | Animal catalog (15 fields) | `animals` |
| `services` | Zoo services with pricing | `services` |
| `reviews` | Moderated visitor reviews | `reviews` |
| `veterinary_reports` | Vet health reports | `veterinary_reports` |
| `feeding_records` | Employee feeding logs | `feeding_records` |
| `visitors` | Registered visitors | `visitors` |
| `bookings` | Service bookings | `bookings` |
| `contact_submissions` | Contact form entries | `contact_submissions` |
| `contact_info` | Static zoo contact details | `contact_info` |
| `animal_clicks` | Click analytics (replaces MongoDB) | `zoo_database.clicks` + 3 others |

## Setup

### Prerequisites
- Node.js 18+
- A [Supabase](https://supabase.com) account (free tier works)

### 1. Clone and install

```bash
git clone https://github.com/theWQLker/arcadia-zoo-management
cd arcadia-zoo-management
git checkout v2
npm install
```

### 2. Set up Supabase

1. Create a new Supabase project
2. Go to SQL Editor and run the contents of `supabase/schema.sql`
3. Copy your project URL and keys from Settings → API

### 3. Configure environment

```bash
cp .env.example .env.local
# Edit .env.local with your Supabase credentials
```

### 4. Run locally

```bash
npm run dev
```

Visit `http://localhost:3000`. Login with `admin` / `admin123`.

## Deployment

### Vercel (Recommended)

1. Push to GitHub
2. Import project in [Vercel](https://vercel.com)
3. Add environment variables from `.env.example`
4. Deploy

### Railway

1. Connect GitHub repo
2. Add environment variables
3. Deploy — Railway auto-detects Next.js

Both platforms have free tiers that support this application.

## Default Login

| Username | Password | Role |
|----------|----------|------|
| `admin` | `admin123` | Admin |

Create additional users (vet, employee) via the admin dashboard after first login.

## Project Structure

```
src/
├── app/
│   ├── api/              # API routes (auth, CRUD, analytics)
│   ├── dashboard/
│   │   ├── admin/        # Admin pages (animals, users, services, reviews, vet-reports, analytics)
│   │   ├── employee/     # Employee pages (feeding-logs)
│   │   └── vet/          # Vet pages (vet-reports)
│   ├── animals/          # Public animal browsing + detail pages
│   ├── services/         # Public services page
│   ├── bookings/         # Public booking form
│   ├── contact/          # Contact form
│   ├── about/            # About page
│   └── login/            # Authentication
├── components/           # Shared UI components
├── lib/                  # Supabase clients, auth utilities
└── types/                # TypeScript interfaces
supabase/
└── schema.sql            # Full database schema + seed data
```

---

*V2 rebuild of DWWM diploma coursework. V1 (procedural PHP) available on the main branch.*
