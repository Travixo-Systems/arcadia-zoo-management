-- Arcadia Zoo Management V2 - Supabase Schema
-- Migrated from MySQL V1 (10 tables preserved)

-- 1. Users table
CREATE TABLE IF NOT EXISTS users (
  username TEXT PRIMARY KEY,
  password TEXT NOT NULL,
  name TEXT NOT NULL,
  lastname TEXT NOT NULL,
  age INTEGER
);

-- 2. User role assignments
CREATE TABLE IF NOT EXISTS user_role_assignments (
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL REFERENCES users(username) ON DELETE CASCADE,
  role_type TEXT NOT NULL CHECK (role_type IN ('admin', 'vet', 'emp')),
  UNIQUE(username, role_type)
);

-- 3. Habitats
CREATE TABLE IF NOT EXISTS habitats (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  image_url TEXT
);

-- 4. Animals
CREATE TABLE IF NOT EXISTS animals (
  id SERIAL PRIMARY KEY,
  prenom TEXT NOT NULL,
  race TEXT NOT NULL,
  habitat_id INTEGER REFERENCES habitats(id) ON DELETE SET NULL,
  diet TEXT,
  description TEXT,
  characteristics TEXT,
  image_url TEXT,
  species TEXT,
  UNIQUE(prenom, species),
  lifespan TEXT,
  size_weight TEXT,
  gestation TEXT,
  natural_habitat TEXT,
  native_region TEXT,
  lifestyle TEXT,
  distinctive_features TEXT
);

-- 5. Services
CREATE TABLE IF NOT EXISTS services (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  description TEXT NOT NULL,
  price DECIMAL(10,2) NOT NULL DEFAULT 0,
  availability_schedule TEXT,
  image_url TEXT
);

-- 6. Reviews
CREATE TABLE IF NOT EXISTS reviews (
  id SERIAL PRIMARY KEY,
  visitor_name TEXT NOT NULL,
  review TEXT NOT NULL,
  rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
  review_date TIMESTAMPTZ DEFAULT NOW(),
  approved BOOLEAN DEFAULT FALSE
);

-- 7. Veterinary reports
CREATE TABLE IF NOT EXISTS veterinary_reports (
  report_id SERIAL PRIMARY KEY,
  animal_id INTEGER NOT NULL REFERENCES animals(id) ON DELETE CASCADE,
  vet_username TEXT NOT NULL REFERENCES users(username) ON DELETE CASCADE,
  report_date DATE NOT NULL,
  health_status TEXT NOT NULL,
  treatment TEXT,
  weight_at_checkup DECIMAL(10,2),
  follow_up_date DATE,
  habitat_comments TEXT
);

-- 8. Feeding records
CREATE TABLE IF NOT EXISTS feeding_records (
  record_id SERIAL PRIMARY KEY,
  animal_id INTEGER NOT NULL REFERENCES animals(id) ON DELETE CASCADE,
  meal_preparation TEXT NOT NULL,
  weight DECIMAL(10,2),
  feeding_time TIMESTAMPTZ DEFAULT NOW()
);

-- 9. Visitors
CREATE TABLE IF NOT EXISTS visitors (
  username TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  lastname TEXT NOT NULL
);

-- 10. Bookings
CREATE TABLE IF NOT EXISTS bookings (
  id SERIAL PRIMARY KEY,
  visitor_username TEXT NOT NULL REFERENCES visitors(username) ON DELETE CASCADE,
  service_id INTEGER NOT NULL REFERENCES services(id) ON DELETE CASCADE,
  booking_date DATE NOT NULL,
  status TEXT DEFAULT 'Pending'
);

-- Contact submissions (was contact_submissions in V1)
CREATE TABLE IF NOT EXISTS contact_submissions (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  phone TEXT,
  subject TEXT,
  message TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Contact info (static zoo info)
CREATE TABLE IF NOT EXISTS contact_info (
  id SERIAL PRIMARY KEY,
  type TEXT NOT NULL UNIQUE,
  value TEXT NOT NULL
);

-- Animal click analytics (replaces MongoDB sprawl - single clean table)
CREATE TABLE IF NOT EXISTS animal_clicks (
  id SERIAL PRIMARY KEY,
  animal_id INTEGER NOT NULL REFERENCES animals(id) ON DELETE CASCADE,
  click_count INTEGER DEFAULT 1,
  animal_name TEXT NOT NULL,
  first_click TIMESTAMPTZ DEFAULT NOW(),
  last_click TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(animal_id)
);

-- Seed data is in seed-data.sql — run that file after this schema.
