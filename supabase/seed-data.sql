-- =========================================================
-- ARCADIA ZOO MANAGEMENT V2 — DEFINITIVE SEED DATA
-- Run AFTER schema.sql in Supabase SQL Editor
-- =========================================================
-- Unique constraints defined in schema.sql — ON CONFLICT
-- handles safe re-runs on every table.
--
-- PASSWORDS (plaintext kept here for dev/demo recovery only)
--   All accounts : admin123
--   Bcrypt hash  : $2a$10$rQEY7gBFpHJnEqJ.6fZGxOuJiYkB2xwLfG2k5q8XqO.uVpQV5dPi
--   NOTE: Confirm hash via bcrypt.compare('admin123', hash) before any
--         production deployment.
--
-- UNSPLASH IMAGE URLS
--   Format: https://images.unsplash.com/photo-{id}?w=800&q=80
--   IDs sourced from Unsplash public library. Verify availability
--   if images do not load — replace the photo-{id} segment only.
-- =========================================================


-- ---------------------------------------------------------
-- 1. USERS (7 staff accounts)
-- ---------------------------------------------------------
INSERT INTO users (username, password, name, lastname, age) VALUES
  ('admin1', '$2a$10$rQEY7gBFpHJnEqJ.6fZGxOuJiYkB2xwLfG2k5q8XqO.uVpQV5dPi', 'Admin',  'Zoo',      35),
  ('vet1',   '$2a$10$rQEY7gBFpHJnEqJ.6fZGxOuJiYkB2xwLfG2k5q8XqO.uVpQV5dPi', 'Claire', 'Dumont',   38),
  ('vet2',   '$2a$10$rQEY7gBFpHJnEqJ.6fZGxOuJiYkB2xwLfG2k5q8XqO.uVpQV5dPi', 'Marc',   'Renaud',   42),
  ('emp1',   '$2a$10$rQEY7gBFpHJnEqJ.6fZGxOuJiYkB2xwLfG2k5q8XqO.uVpQV5dPi', 'Lucas',  'Moreau',   29),
  ('emp2',   '$2a$10$rQEY7gBFpHJnEqJ.6fZGxOuJiYkB2xwLfG2k5q8XqO.uVpQV5dPi', 'Chloe',  'Petit',    33),
  ('emp3',   '$2a$10$rQEY7gBFpHJnEqJ.6fZGxOuJiYkB2xwLfG2k5q8XqO.uVpQV5dPi', 'Hugo',   'Bernard',  27),
  ('emp4',   '$2a$10$rQEY7gBFpHJnEqJ.6fZGxOuJiYkB2xwLfG2k5q8XqO.uVpQV5dPi', 'Sophie', 'Laurent',  31)
ON CONFLICT (username) DO NOTHING;

INSERT INTO user_role_assignments (username, role_type) VALUES
  ('admin1', 'admin'),
  ('vet1',   'vet'),
  ('vet2',   'vet'),
  ('emp1',   'emp'),
  ('emp2',   'emp'),
  ('emp3',   'emp'),
  ('emp4',   'emp')
ON CONFLICT (username, role_type) DO NOTHING;


-- ---------------------------------------------------------
-- 2. CONTACT INFO  (original French data from arcadia_db dump)
-- ---------------------------------------------------------
INSERT INTO contact_info (type, value) VALUES
  ('Address',       E'Parc Zoologique d\'Arcadia\n2 Avenue de Verdun\n69330 Meyzieu\nFrance'),
  ('Phone',         E'General Inquiries: +33 4 72 45 63 00\nTicketing: +33 4 72 45 63 01'),
  ('Email',         E'General Inquiries: info@parczooarcadia.fr\nPress Inquiries: presse@parczooarcadia.fr\nLost & Found: objets-trouves@parczooarcadia.fr'),
  ('Hours',         E'Zoo Hours:\nMonday - Friday: 9h30 - 18h00\nSaturday - Sunday: 9h30 - 19h00\nAdministrative Office Hours:\nMonday - Friday: 8h30 - 17h00'),
  ('Emergency',     '+33 4 72 45 63 99'),
  ('Instagram',     '@parczooarcadia'),
  ('Facebook',      'Parc Zoologique d''Arcadia'),
  ('Parking',       'Free visitor parking on site, open daily 9h00 - 20h00'),
  ('Accessibility', 'Wheelchair-accessible paths, audio guides and tactile maps available on request')
ON CONFLICT (type) DO NOTHING;


-- ---------------------------------------------------------
-- 3. HABITATS (8)
-- ---------------------------------------------------------
INSERT INTO habitats (name, image_url) VALUES
  ('Savanna',         'https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=800&q=80'),
  ('Jungle',          'https://images.unsplash.com/photo-1440342359743-84fcb8c21f21?w=800&q=80'),
  ('Wetlands',        'https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=800&q=80'),
  ('Tundra',          'https://upload.wikimedia.org/wikipedia/commons/1/17/Greenland_scoresby-sydkapp2_hg.jpg'),
  ('Desert',          'https://images.unsplash.com/photo-1509316785289-025f5b846b35?w=800&q=80'),
  ('Mountain',        'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=800&q=80'),
  ('Tropical Aviary', 'https://images.unsplash.com/photo-1552728089-57bdde30beb3?w=800&q=80'),
  ('Aquatic Zone',    'https://images.unsplash.com/photo-1437622368342-7a3d73a34c8f?w=800&q=80')
ON CONFLICT (name) DO NOTHING;


-- ---------------------------------------------------------
-- 4. SERVICES (7)
--    Original 3 from arcadia_db: Rainforest Cafe, Zoo Train Tour, Guided Tour
--    New 4: Night Safari, Animal Encounter, Junior Zookeeper Workshop, VIP Behind the Scenes
-- ---------------------------------------------------------
INSERT INTO services (name, description, price, availability_schedule, image_url) VALUES
  ('Rainforest Cafe',
   'Dine surrounded by tropical plants and the sounds of the jungle. A full menu of fresh, seasonal dishes served in an immersive environment.',
   25.00, 'Daily 11h00 - 15h00',
   'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=800&q=80'),

  ('Zoo Train Tour',
   'Hop aboard our open-air train for a relaxed circuit of all eight habitats with live keeper commentary.',
   15.00, 'Daily 10h00 - 17h00 (departures every 30 minutes)',
   'https://images.unsplash.com/photo-1474487548417-781cb6d646b7?w=800&q=80'),

  ('Guided Tour',
   'Join an expert guide for a 90-minute walking tour covering the highlights of the park with fascinating facts about each species.',
   10.00, 'Daily 10h00 and 14h00',
   'https://images.unsplash.com/photo-1516426122078-c23e76319801?w=800&q=80'),

  ('Night Safari',
   'Experience nocturnal animal behaviour on an exclusive after-dark guided walk. Torches provided; maximum 15 guests per session.',
   35.00, 'Friday and Saturday 20h00 - 22h30',
   'https://images.unsplash.com/photo-1470093851219-69951fcbb533?w=800&q=80'),

  ('Animal Encounter',
   'A supervised close-up session with carefully selected animals led by a trained keeper. Suitable for all ages.',
   15.00, 'Daily 11h00 - 15h00',
   'https://images.unsplash.com/photo-1474511320723-9a56873571b7?w=800&q=80'),

  ('Junior Zookeeper Workshop',
   'Hands-on workshop for children aged 6–14 covering feeding, enrichment preparation and basic keeper duties.',
   18.00, 'Wednesday to Sunday 14h00',
   'https://images.unsplash.com/photo-1503454537195-1dcabb73ffb9?w=800&q=80'),

  ('VIP Behind the Scenes',
   'Exclusive early-morning access to animal care areas, private briefing with senior staff and a commemorative keeper certificate.',
   60.00, 'Saturday 09h00 - 11h00 (maximum 8 guests)',
   'https://images.unsplash.com/photo-1503919545889-aef636e10ad4?w=800&q=80')
ON CONFLICT (name) DO NOTHING;


-- ---------------------------------------------------------
-- 5. ANIMALS (50 across 8 habitats)
--
--    Name renames applied to remove copyrighted references:
--      Simba   → Kofi    (Lion)
--      Pumbaa  → Tusker  (Warthog)
--      Bagheera→ Shadow  (Jaguar)
--      Mowgli  → Howl    (Howler Monkey)
--      Kaa     → Coil    (Anaconda)
--      Raja    → Bumi    (Orangutan)
--      Frodo   → Jumper  (Bullfrog)
--    Non-copyrighted names kept:
--      Twiga, Nia, Zazu, Tico, Gator, Nessie, Herbie, Swampy,
--      Nanook, Blizzard, Tundra, Snowy, Frost
-- ---------------------------------------------------------
INSERT INTO animals (
  prenom, race, habitat_id, diet,
  description, characteristics, image_url,
  species, lifespan, size_weight, gestation,
  natural_habitat, native_region, lifestyle, distinctive_features
) VALUES

-- ── SAVANNA (7) ──────────────────────────────────────────────────────────────
(
  'Kofi', 'Lion',
  (SELECT id FROM habitats WHERE name = 'Savanna'),
  'Carnivore',
  'Dominant male lion and undisputed leader of the savanna enclosure. His powerful roar sets the tone at dawn each day.',
  'Strong, territorial, social',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/020_The_lion_king_Snyggve_in_the_Serengeti_National_Park_Photo_by_Giles_Laurent.jpg/3840px-020_The_lion_king_Snyggve_in_the_Serengeti_National_Park_Photo_by_Giles_Laurent.jpg',
  'Panthera leo',
  '10–14 years (up to 20 in captivity)',
  '150–225 kg / 1.2 m shoulder height',
  '110 days',
  'Open grasslands and savannas',
  'Sub-Saharan Africa',
  'Pride-based social groups led by one or two adult males',
  'Full dark mane in adult males; roar audible up to 8 km; retractable claws'
),
(
  'Twiga', 'Giraffe',
  (SELECT id FROM habitats WHERE name = 'Savanna'),
  'Herbivore',
  'The tallest resident of the park, regularly browsing from the high-branch feeding platforms. Her name means "giraffe" in Swahili.',
  'Gentle, vigilant, inquisitive',
  'https://upload.wikimedia.org/wikipedia/commons/a/ac/Flickr_-_Rainbirder_-_Reticulated_Giraffe_drinking.jpg',
  'Giraffa camelopardalis',
  '20–25 years',
  'Up to 800 kg / 5.5 m tall (males)',
  '15 months',
  'Open woodland and savannas',
  'Africa',
  'Loose, non-territorial social groups',
  'Longest neck of any living animal; reticulated coat pattern; short ossicones; 45 cm prehensile tongue'
),
(
  'Nia', 'African Elephant',
  (SELECT id FROM habitats WHERE name = 'Savanna'),
  'Herbivore',
  'Matriarch of the savanna enclosure. Calm, protective and highly attentive to the younger animals in her group.',
  'Highly intelligent, empathetic, protective',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/178_Male_African_bush_elephant_in_Etosha_National_Park_Photo_by_Giles_Laurent.jpg/3840px-178_Male_African_bush_elephant_in_Etosha_National_Park_Photo_by_Giles_Laurent.jpg',
  'Loxodonta africana',
  '60–70 years',
  '4 000–6 000 kg / up to 3.3 m at shoulder',
  '22 months',
  'Savannas, bushland and woodlands',
  'Sub-Saharan Africa',
  'Matriarchal herd structure; strong family memory',
  'Largest land animal; large fan-shaped ears aid thermoregulation; uses trunk for water, feeding and social bonding'
),
(
  'Zazu', 'Ground Hornbill',
  (SELECT id FROM habitats WHERE name = 'Savanna'),
  'Carnivore',
  'Bold and deliberate, Zazu patrols the savanna floor hunting insects, lizards and small rodents.',
  'Bold, slow-paced, cooperative breeder',
  'https://upload.wikimedia.org/wikipedia/commons/c/c7/Southern_Ground_Hornbill_%28Bucorvus_leadbeateri%29_male_%2812714625605%29%2C_crop.jpg',
  'Bucorvus leadbeateri',
  '40–60 years',
  '3–6 kg / 90–100 cm body length',
  'Egg-laying; 37–43 day incubation',
  'Open savannas and grasslands',
  'Sub-Saharan Africa',
  'Cooperative breeding groups of 2–11 individuals',
  'Vivid red facial and throat skin in males; large curved casqued bill; primarily terrestrial despite being a bird'
),
(
  'Tusker', 'Warthog',
  (SELECT id FROM habitats WHERE name = 'Savanna'),
  'Omnivore',
  'Energetic and resourceful, Tusker spends the morning rooting along the savanna edge with his distinctive trotting gait — tail held straight up.',
  'Resilient, bold, fast mover',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Southern_warthog_%28Phacochoerus_africanus_sundevallii%29_male.jpg/3840px-Southern_warthog_%28Phacochoerus_africanus_sundevallii%29_male.jpg',
  'Phacochoerus africanus',
  '15–18 years',
  '60–150 kg / 63–85 cm at shoulder',
  '5.5 months',
  'Open and wooded savannas',
  'Sub-Saharan Africa',
  'Family sounders; males mostly solitary outside breeding season',
  'Four facial warts protect skin during combat; curved ivory tusks; tail held vertically when running; kneels to graze on short grass'
),
(
  'Duma', 'Cheetah',
  (SELECT id FROM habitats WHERE name = 'Savanna'),
  'Carnivore',
  'Slender and supremely agile, Duma is the fastest land animal in the park. Built for acceleration rather than endurance.',
  'Alert, athletic, solitary',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Male_cheetah_facing_left_in_South_Africa.jpg/3840px-Male_cheetah_facing_left_in_South_Africa.jpg',
  'Acinonyx jubatus',
  '10–12 years (up to 17 in captivity)',
  '21–72 kg / 1.1–1.4 m body length',
  '90–95 days',
  'Open grasslands and semi-arid plains',
  'Africa; small relict population in Iran',
  'Mostly solitary; females raise cubs alone; no defended territory for males',
  'Non-retractable claws provide grip during sprints; black tear-stripe from eye to jaw; small rounded head; deep chest for lung capacity'
),
(
  'Kesi', 'White Rhinoceros',
  (SELECT id FROM habitats WHERE name = 'Savanna'),
  'Herbivore',
  'The second largest land animal in the park. Kesi spends much of the day grazing or cooling off in the mud wallow.',
  'Calm, territorial, protective with young',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/109_Male_White_rhinoceros_walking_in_the_Kalahari_Desert_of_Namibia_Photo_by_Giles_Laurent.jpg/3840px-109_Male_White_rhinoceros_walking_in_the_Kalahari_Desert_of_Namibia_Photo_by_Giles_Laurent.jpg',
  'Ceratotherium simum',
  '40–50 years',
  '1 700–2 300 kg / 1.8 m at shoulder',
  '16–18 months',
  'Grasslands and bushveld',
  'Southern Africa',
  'Small herds ("crashes"); solitary adult males',
  'Two keratin horns (front horn can exceed 1 m); wide square lip adapted for cropping grass; poor eyesight offset by acute hearing and smell'
),

-- ── JUNGLE (7) ───────────────────────────────────────────────────────────────
(
  'Shadow', 'Jaguar',
  (SELECT id FROM habitats WHERE name = 'Jungle'),
  'Carnivore',
  'Powerfully built apex predator of the jungle enclosure. Active at dawn and dusk, often observed near the water feature.',
  'Solitary, stealthy, exceptionally strong bite',
  'https://upload.wikimedia.org/wikipedia/commons/0/0a/Standing_jaguar.jpg',
  'Panthera onca',
  '12–15 years (up to 23 in captivity)',
  '56–96 kg / 1.1–1.9 m body length',
  '93–105 days',
  'Tropical rainforests, wetlands and grasslands',
  'Central and South America',
  'Largely solitary and territorial; males have large home ranges',
  'Rosette markings with central spots; third-largest big cat; strongest bite relative to size of any big cat; comfortable swimmer'
),
(
  'Howl', 'Howler Monkey',
  (SELECT id FROM habitats WHERE name = 'Jungle'),
  'Herbivore',
  'One of the loudest animals in the park. His dawn calls can be heard clearly from across the entire grounds.',
  'Vocal, arboreal, slow-moving',
  'https://upload.wikimedia.org/wikipedia/commons/7/70/Alouatta_seniculus_Sorocaba.JPG',
  'Alouatta seniculus',
  '15–20 years',
  '4–10 kg / 56–72 cm body length',
  '180–194 days',
  'Tropical and subtropical forests',
  'South America',
  'Multi-male, multi-female troops of 6–15 individuals',
  'Enlarged hyoid bone amplifies call to 140 dB; prehensile tail functions as a fifth limb; one of the loudest land animals'
),
(
  'Bumi', 'Bornean Orangutan',
  (SELECT id FROM habitats WHERE name = 'Jungle'),
  'Omnivore',
  'Thoughtful and observant, Bumi is the most proficient tool-user in the park and demonstrates complex problem-solving.',
  'Highly intelligent, deliberate, semi-solitary',
  'https://upload.wikimedia.org/wikipedia/commons/d/d6/Tanjung_Puting30477.jpg',
  'Pongo pygmaeus',
  '35–45 years',
  'Males 50–90 kg / Females 30–50 kg; arm span up to 2.3 m',
  '8.5 months',
  'Tropical lowland and montane forests',
  'Borneo',
  'Semi-solitary; adult males maintain large solitary ranges',
  'Long reddish-orange hair; flanged cheek pads develop on adult males; shares 96.9% of DNA with humans'
),
(
  'Tico', 'Scarlet Macaw',
  (SELECT id FROM habitats WHERE name = 'Jungle'),
  'Omnivore',
  'Vivid and vocal, Tico commands attention in the jungle canopy section with brilliant plumage and confident mimicry.',
  'Loud, social, intelligent, long-lived',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Scarlet_macaw_%28Ara_macao_cyanopterus%29_Copan.jpg/3840px-Scarlet_macaw_%28Ara_macao_cyanopterus%29_Copan.jpg',
  'Ara macao',
  '40–50 years',
  'Approx. 1 kg / 81–96 cm total length; wingspan up to 1.1 m',
  '24–28 day incubation',
  'Humid tropical forests and woodland edges',
  'Mexico to Bolivia and Brazil',
  'Lifelong pair bonds; nests in tree cavities',
  'Scarlet body with yellow and blue wing patches; bare white facial skin; powerful nut-cracking bill'
),
(
  'Kondo', 'Western Gorilla',
  (SELECT id FROM habitats WHERE name = 'Jungle'),
  'Herbivore',
  'Gentle giant of the jungle enclosure. Kondo spends much of the day foraging methodically for fruit, leaves and shoots.',
  'Intelligent, calm, family-oriented',
  'https://upload.wikimedia.org/wikipedia/commons/5/50/Male_gorilla_in_SF_zoo.jpg',
  'Gorilla gorilla',
  '35–40 years (up to 50 in captivity)',
  'Males 140–220 kg / Females 70–110 kg; up to 1.8 m standing',
  '8.5 months',
  'Dense tropical and subtropical forests',
  'Central Africa',
  'Troops of 5–10 led by one dominant silverback',
  'Silverback males develop grey saddle with age; knuckle-walking locomotion; DNA 98.3% identical to humans'
),
(
  'Toco', 'Toco Toucan',
  (SELECT id FROM habitats WHERE name = 'Jungle'),
  'Omnivore',
  'The park''s most photographed bird. Toco''s enormous bill is entirely hollow to keep body weight low despite its dramatic size.',
  'Curious, social, lightweight',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/006_Toco_toucan_in_Encontro_das_%C3%81guas_State_Park_Photo_by_Giles_Laurent.jpg/3840px-006_Toco_toucan_in_Encontro_das_%C3%81guas_State_Park_Photo_by_Giles_Laurent.jpg',
  'Ramphastos toco',
  '15–20 years',
  '500–860 g / 55–65 cm total length',
  'Egg-laying; 15–18 day incubation',
  'Tropical and subtropical forests and open woodland',
  'South America',
  'Small groups; breeding pairs share nesting cavity',
  'Largest bill relative to body size of any bird; orange-yellow bill with black base and blue-grey base; serrated edge aids fruit handling'
),
(
  'Baro', 'South American Tapir',
  (SELECT id FROM habitats WHERE name = 'Jungle'),
  'Herbivore',
  'Shy and largely nocturnal. Baro is a keystone seed disperser — seeds pass intact through his digestive system.',
  'Docile, shy, nocturnal tendency',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/South_American_tapir_%28Tapirus_terrestris%29.JPG/3840px-South_American_tapir_%28Tapirus_terrestris%29.JPG',
  'Tapirus terrestris',
  '25–30 years',
  '150–300 kg / 1.8–2.5 m body length',
  '13 months',
  'Tropical rainforests and wetland edges',
  'South America',
  'Mostly solitary; come together only to breed',
  'Short flexible prehensile proboscis; white-tipped ears; excellent swimmer; striped/spotted coat in juveniles fades with age'
),

-- ── WETLANDS (7) ─────────────────────────────────────────────────────────────
(
  'Gator', 'American Alligator',
  (SELECT id FROM habitats WHERE name = 'Wetlands'),
  'Carnivore',
  'Ancient and patient, Gator spends most of the day basking at the water''s edge — a behaviour essential for thermoregulation.',
  'Ambush predator, patient, territorial',
  'https://upload.wikimedia.org/wikipedia/commons/5/5e/Alligator_mississippiensis_defensive.jpg',
  'Alligator mississippiensis',
  '35–50 years (up to 80 in captivity)',
  '180–360 kg / 3.4–4.6 m',
  'Egg-laying; approx. 65-day incubation',
  'Freshwater wetlands, swamps and marshes',
  'Southeastern United States',
  'Mostly solitary; females are exceptionally protective mothers',
  'Broad rounded snout distinguishes alligators from crocodiles; armoured osteoderms along spine; one of few reptiles to vocalise'
),
(
  'Jumper', 'American Bullfrog',
  (SELECT id FROM habitats WHERE name = 'Wetlands'),
  'Carnivore',
  'The largest frog in North America. Jumper''s powerful hind legs can launch him over 1 metre in a single leap.',
  'Opportunistic, territorial, vocal',
  'https://upload.wikimedia.org/wikipedia/commons/a/aa/North-American-bullfrog1.jpg',
  'Lithobates catesbeianus',
  '7–10 years (up to 16 in captivity)',
  'Up to 0.5 kg / 9–15 cm body length',
  'Egg-laying; tadpoles metamorphose over 1–3 years',
  'Ponds, lakes, slow-moving rivers and wetlands',
  'Eastern North America',
  'Males are territorial; solitary outside breeding season',
  'Males produce a loud resonant bass call; green dorsal skin with brown blotching; tympanum diameter greater than eye diameter in males'
),
(
  'Nessie', 'Great Cormorant',
  (SELECT id FROM habitats WHERE name = 'Wetlands'),
  'Carnivore',
  'Expert diver reaching 3–4 m underwater in pursuit of fish. Often spotted standing with wings outstretched to dry.',
  'Skilled diver, patient fisher, colonial',
  'https://upload.wikimedia.org/wikipedia/commons/c/c3/2021-05-05_Phalacrocorax_carbo_carbo%2C_Killingworth_Lake%2C_Northumberland_1-1.jpg',
  'Phalacrocorax carbo',
  '20–25 years',
  '2.6–3.7 kg / 80–100 cm; wingspan 121–149 cm',
  'Egg-laying; 28–31 day incubation',
  'Coasts, estuaries, rivers and wetlands',
  'Europe, Asia, Africa and Australasia',
  'Colonial nesting; solitary when feeding',
  'Iridescent dark plumage; yellow-orange facial skin; hook-tipped bill; plumage not fully waterproof — must dry wings between dives'
),
(
  'Herbie', 'Grey Heron',
  (SELECT id FROM habitats WHERE name = 'Wetlands'),
  'Carnivore',
  'Tall and statuesque, Herbie stands motionless in shallow water for extended periods before striking at fish with lightning speed.',
  'Patient, precision hunter, solitary feeder',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Grey_heron_2022_03_18_01.jpg/3840px-Grey_heron_2022_03_18_01.jpg',
  'Ardea cinerea',
  '5 years median wild (up to 25 in captivity)',
  '1–2 kg / 84–102 cm; wingspan up to 175 cm',
  'Egg-laying; 25–26 day incubation',
  'Wetlands, rivers, estuaries and coastal areas',
  'Europe, Asia and Africa',
  'Mostly solitary when feeding; colonial nesting in heronries',
  'Grey-blue plumage; long yellow-orange dagger bill; black supercilium and plumes; retracts neck in S-curve during flight'
),
(
  'Swampy', 'West Indian Manatee',
  (SELECT id FROM habitats WHERE name = 'Wetlands'),
  'Herbivore',
  'Peaceful and slow-moving, Swampy grazes on aquatic plants in the warmed wetland pool. One of the gentlest animals in the park.',
  'Gentle, slow, inquisitive',
  'https://upload.wikimedia.org/wikipedia/commons/9/99/Manatee_with_calf.PD_-_colour_corrected.jpg',
  'Trichechus manatus',
  '40–60 years',
  '400–590 kg / 2.7–3.5 m',
  '12–14 months; single calf',
  'Warm coastal waters, estuaries and slow rivers',
  'Caribbean and Atlantic coast of the Americas',
  'Mostly solitary; cows and calves maintain close bond for up to 2 years',
  'Paddle-shaped tail; split upper lip for feeding; no natural predators; slow metabolic rate; must surface to breathe every 3–5 minutes'
),
(
  'Rosa', 'Greater Flamingo',
  (SELECT id FROM habitats WHERE name = 'Wetlands'),
  'Omnivore',
  'Social and elegant, Rosa filters brine shrimps and cyanobacteria from the water using her uniquely inverted bill.',
  'Highly social, graceful, specialist filter feeder',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/010_Greater_flamingos_male_and_female_in_the_Camargue_during_mating_season_Photo_by_Giles_Laurent.jpg/3840px-010_Greater_flamingos_male_and_female_in_the_Camargue_during_mating_season_Photo_by_Giles_Laurent.jpg',
  'Phoenicopterus roseus',
  '30–40 years (up to 83 recorded in captivity)',
  '2–4 kg / 120–145 cm tall; wingspan 140–165 cm',
  'Egg-laying; 27–31 day incubation',
  'Shallow saline and brackish wetlands and coastal lagoons',
  'Southern Europe, Africa and South Asia',
  'Large dense colonies numbering thousands',
  'Pink plumage deepens with carotenoid-rich diet; uniquely bent bill operated upside-down; one of the world''s longest-lived birds'
),
(
  'Swift', 'European Otter',
  (SELECT id FROM habitats WHERE name = 'Wetlands'),
  'Carnivore',
  'Nimble and playful, Swift is frequently seen sliding down the muddy bank, floating on his back, or chasing fish in the stream channel.',
  'Playful, agile, territorial',
  'https://upload.wikimedia.org/wikipedia/commons/d/d3/Fischotter%2C_Lutra_Lutra.JPG',
  'Lutra lutra',
  '10–16 years',
  '7–12 kg / 57–95 cm body length (tail adds 35–40 cm)',
  '60–63 days',
  'Rivers, lakes, estuaries and coastal wetlands',
  'Europe and Asia',
  'Mostly solitary; females raise cubs alone; males maintain large riparian territories',
  'Dense waterproof double coat; webbed feet; long sensitive whiskers detect fish movement underwater'
),

-- ── TUNDRA (7) ───────────────────────────────────────────────────────────────
(
  'Nanook', 'Polar Bear',
  (SELECT id FROM habitats WHERE name = 'Tundra'),
  'Carnivore',
  'The park''s largest carnivore and an exceptional swimmer. Nanook regularly makes use of the large chilled pool and can swim for hours without rest.',
  'Powerful, curious, excellent swimmer',
  'https://upload.wikimedia.org/wikipedia/commons/6/66/Polar_Bear_-_Alaska_%28cropped%29.jpg',
  'Ursus maritimus',
  '20–25 years (up to 32 in captivity)',
  'Males 350–700 kg / 2.2–2.5 m body length',
  '8 months including delayed implantation',
  'Sea ice, open ocean and arctic coastlines',
  'Arctic Circle',
  'Mostly solitary; mothers with cubs form temporary family units',
  'Translucent hollow guard hairs over black skin; partial webbing on forepaws; stomach can hold 70 kg of food; excellent sense of smell'
),
(
  'Blizzard', 'Arctic Fox',
  (SELECT id FROM habitats WHERE name = 'Tundra'),
  'Omnivore',
  'Small and highly adaptable, Blizzard''s coat shifts from white in winter to grey-brown in summer — one of the most dramatic seasonal changes in mammals.',
  'Agile, adaptable, opportunistic',
  'https://upload.wikimedia.org/wikipedia/commons/d/dc/Vulpes_lagopus_in_Iceland_%28cropped_3%29.jpg',
  'Vulpes lagopus',
  '3–6 years in wild (up to 14 in captivity)',
  '3–8 kg / 46–68 cm body length',
  '49–57 days',
  'Arctic tundra, subarctic and sea ice edges',
  'Circumpolar Arctic',
  'Monogamous pair; family groups share den territory',
  'Seasonal coat camouflage; short rounded ears to reduce heat loss; compact body form minimises surface-area-to-volume ratio'
),
(
  'Tundra', 'Caribou',
  (SELECT id FROM habitats WHERE name = 'Tundra'),
  'Herbivore',
  'The only deer species in which both sexes grow antlers. Tundra is calm and sociable with other tundra residents.',
  'Social, enduring, built for cold environments',
  'https://upload.wikimedia.org/wikipedia/commons/9/96/Reinbukken_p%C3%A5_frisk_gr%C3%B8nt_beite._-_panoramio.jpg',
  'Rangifer tarandus',
  '12–15 years',
  '60–318 kg / 1.6–2.1 m body length',
  '7.5 months',
  'Arctic tundra, boreal forest and subalpine mountains',
  'Circumpolar: North America, Greenland, Scandinavia and Russia',
  'Large migratory herds in wild; cows and calves in nursery groups',
  'Both sexes grow antlers — unique among deer; large concave hooves act as natural snowshoes and paddles; insulating hollow hair shafts'
),
(
  'Snowy', 'Snowy Owl',
  (SELECT id FROM habitats WHERE name = 'Tundra'),
  'Carnivore',
  'One of the heaviest owls in the world. Snowy is diurnal — active during daylight — and is visible at most visiting hours in the tundra enclosure.',
  'Diurnal, patient, powerful predator',
  'https://upload.wikimedia.org/wikipedia/commons/f/f1/SnowyOwlAmericanBlackDuck.jpg',
  'Bubo scandiacus',
  '9–10 years in wild (up to 28 in captivity)',
  '1.6–3 kg / 52–71 cm; wingspan 125–150 cm',
  'Egg-laying; 31–33 day incubation',
  'Open arctic tundra',
  'Circumpolar Arctic',
  'Mostly solitary outside breeding; females guard nest aggressively',
  'White plumage with variable dark bars; striking yellow eyes; almost silent flight; heavily feathered feet for insulation'
),
(
  'Frost', 'Humboldt Penguin',
  (SELECT id FROM habitats WHERE name = 'Tundra'),
  'Carnivore',
  'Fast and precise underwater, Frost can reach 30 km/h in the chilled pool. One of the most interactive animals during keeper presentations.',
  'Social, vocal, agile swimmer',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Spheniscus_humboldti_%2854905367722%29.jpg/3840px-Spheniscus_humboldti_%2854905367722%29.jpg',
  'Spheniscus humboldti',
  '15–20 years (up to 30 in captivity)',
  '3.5–5 kg / 56–70 cm',
  'Egg-laying; 38–42 day incubation',
  'Rocky coastlines and offshore islands',
  'Pacific coast of South America (Peru and Chile)',
  'Colonial; nests in burrows or rocky crevices',
  'Black-and-white countershading; pink facial patches and throat; single black chest band; flippers provide propulsion underwater'
),
(
  'Siku', 'Harp Seal',
  (SELECT id FROM habitats WHERE name = 'Tundra'),
  'Carnivore',
  'Named after the Inuit word for ice. Siku is a graceful swimmer with large, forward-facing eyes adapted for underwater vision in low light.',
  'Social, fast swimmer, vocal',
  'https://upload.wikimedia.org/wikipedia/commons/2/22/Harp_Seal_%28Pagophilus_groenlandicus%29%2C_Greenland_Sea_IMG_5075.jpg',
  'Pagophilus groenlandicus',
  '25–35 years',
  '120–135 kg / 1.6–1.9 m',
  '11 months including delayed implantation',
  'Arctic pack ice and surrounding cold waters',
  'North Atlantic and Arctic Ocean',
  'Large aggregations during breeding season; pups raised on sea ice',
  'Adults bear distinctive black harp-shaped saddle marking; silver-grey coat; no external ear — entirely underwater-adapted hearing'
),
(
  'Boreal', 'Musk Ox',
  (SELECT id FROM habitats WHERE name = 'Tundra'),
  'Herbivore',
  'A living relic of the Ice Age. Boreal''s thick double coat includes qiviut — a fibre eight times warmer than sheep wool.',
  'Herd animal, robust, defensively cohesive',
  'https://upload.wikimedia.org/wikipedia/commons/c/ca/Muskox_%28Ovibos_moschatus%29_male_Dovrefjell_4.jpg',
  'Ovibos moschatus',
  '12–20 years',
  '180–400 kg / 1.1–1.5 m at shoulder',
  '8–8.5 months',
  'Arctic tundra and subarctic grasslands',
  'Arctic Canada, Greenland, Alaska; introduced populations in Scandinavia and Russia',
  'Small mixed herds; form defensive outward-facing circle when threatened',
  'Dense double coat (soft qiviut underlayer and long outer guard hair reaching the ground); curved boss horns in both sexes'
),

-- ── DESERT (6) ───────────────────────────────────────────────────────────────
(
  'Sable', 'Dromedary Camel',
  (SELECT id FROM habitats WHERE name = 'Desert'),
  'Herbivore',
  'The park''s desert ambassador. Sable demonstrates remarkable physiological adaptations to heat and water scarcity during keeper talks.',
  'Resilient, calm, enduring',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Camelus_dromedarius_in_Nuweiba.jpg/3840px-Camelus_dromedarius_in_Nuweiba.jpg',
  'Camelus dromedarius',
  '40–50 years',
  '400–690 kg / 1.8–2.3 m to top of hump',
  '13 months',
  'Hot deserts and arid plains',
  'North Africa and Middle East (wild population extinct; domesticated worldwide)',
  'Loose herds of 10–20 in the wild led by a dominant male',
  'Single fat-storing hump; loses up to 40% body water without distress; thick eyelashes and closeable slit nostrils block sand'
),
(
  'Mira', 'Meerkat',
  (SELECT id FROM habitats WHERE name = 'Desert'),
  'Omnivore',
  'Always on lookout duty, Mira stands sentinel on her mound scanning the sky while the rest of the mob forages below.',
  'Alert, highly cooperative, social',
  'https://upload.wikimedia.org/wikipedia/commons/9/9a/Meerkat_%28Suricata_suricatta%29_Tswalu.jpg',
  'Suricata suricatta',
  '12–14 years',
  '0.6–0.9 kg / 25–35 cm body length',
  '11 weeks',
  'Dry open savanna and arid Kalahari plains',
  'Southern Africa',
  'Cooperative colonies of 10–30; shared babysitting and teaching of young',
  'Upright sentinel posture; natural immunity to scorpion venom and some snake venoms; dark eye patches reduce sun glare'
),
(
  'Fennel', 'Fennec Fox',
  (SELECT id FROM habitats WHERE name = 'Desert'),
  'Omnivore',
  'The smallest canid in the world. Fennel''s outsized ears can detect prey moving underground and radiate excess body heat.',
  'Nocturnal, agile, highly social',
  'https://upload.wikimedia.org/wikipedia/commons/9/9f/Fennec_Fox_Vulpes_zerda.jpg',
  'Vulpes zerda',
  '10–14 years',
  '0.8–1.5 kg / 24–41 cm body length',
  '50–52 days',
  'Saharan desert and other arid North African regions',
  'North Africa and Sinai Peninsula',
  'Small family groups; monogamous pairs with offspring from previous seasons',
  'Enormous bat-like ears (up to 15 cm); thick cream fur reflects sunlight; kidney anatomy evolved to produce highly concentrated urine'
),
(
  'Pebble', 'Desert Tortoise',
  (SELECT id FROM habitats WHERE name = 'Desert'),
  'Herbivore',
  'A slow and long-lived desert specialist. Pebble spends up to 95% of her life in burrows to avoid temperature extremes.',
  'Docile, slow-moving, exceptionally long-lived',
  'https://upload.wikimedia.org/wikipedia/commons/f/f4/Gopherus_agassizii.jpg',
  'Gopherus agassizii',
  '50–80 years',
  '4–7 kg / 23–36 cm shell length',
  'Egg-laying; 70–120 day incubation',
  'Mojave and Sonoran desert scrub',
  'Southwestern United States and northwestern Mexico',
  'Largely solitary; shares communal burrow networks',
  'High-domed shell; elephantine hind limbs; urinary bladder stores water for months during dry seasons'
),
(
  'Coil', 'Green Anaconda',
  (SELECT id FROM habitats WHERE name = 'Desert'),
  'Carnivore',
  'The heaviest snake in the world by mass. Coil has a dedicated humidity-controlled aquatic zone within the desert exhibit.',
  'Ambush predator, powerful constrictor, semi-aquatic',
  'https://upload.wikimedia.org/wikipedia/commons/b/b4/Sucuri_verde.jpg',
  'Eunectes murinus',
  '10–20 years',
  'Up to 100+ kg / up to 9 m; females considerably larger than males',
  'Viviparous; 6–7 month gestation; 20–40 live young per litter',
  'Swamps, marshes and slow-moving tropical rivers',
  'South America (Amazon and Orinoco basins)',
  'Mostly solitary; females may coil with multiple males during breeding',
  'Heaviest snake by mass (not longest); olive-green with black oval blotches; eyes and nostrils on top of head for semi-aquatic ambush'
),
(
  'Dune', 'Sidewinder Rattlesnake',
  (SELECT id FROM habitats WHERE name = 'Desert'),
  'Carnivore',
  'A master of locomotion on loose sand. Dune''s unique sidewinding gait leaves characteristic J-shaped tracks in the desert enclosure floor.',
  'Alert, heat-sensing, venomous',
  'https://upload.wikimedia.org/wikipedia/commons/7/70/Crotalus_cerastes_mesquite_springs_CA-2.jpg',
  'Crotalus cerastes',
  '20–25 years',
  '0.3–0.5 kg / 43–76 cm',
  'Viviparous; approx. 167-day gestation; 5–18 live young',
  'Sandy and rocky desert',
  'Mojave and Sonoran Deserts, USA and Mexico',
  'Solitary and nocturnal; ambushes small mammals from concealed position',
  'Horn-like supraocular scales over each eye reduce glare; segmented rattle on tail; paired heat-sensing pits detect infrared radiation'
),

-- ── MOUNTAIN (6) ─────────────────────────────────────────────────────────────
(
  'Ghost', 'Snow Leopard',
  (SELECT id FROM habitats WHERE name = 'Mountain'),
  'Carnivore',
  'Rarely seen in the wild — earning the name "ghost of the mountains". Ghost navigates the elevated rocky terrain with extraordinary grace.',
  'Elusive, agile, solitary',
  'https://upload.wikimedia.org/wikipedia/commons/a/a5/Irbis4.JPG',
  'Panthera uncia',
  '15–18 years (up to 25 in captivity)',
  '27–55 kg / 1.0–1.3 m body length; tail nearly as long as body',
  '90–105 days',
  'Rocky mountain terrain and alpine meadows at 3 000–4 500 m altitude',
  'Central and South Asia (Himalayas, Hindu Kush, Altai Mountains)',
  'Solitary and crepuscular; vast individual home ranges',
  'Thick smoke-grey spotted coat; extraordinarily long thick tail used for balance and warmth; wide nasal cavity adapts breathing to thin mountain air'
),
(
  'Ruki', 'Red Panda',
  (SELECT id FROM habitats WHERE name = 'Mountain'),
  'Herbivore',
  'Shy and nimble, Ruki spends most of the day curled in the bamboo canopy. Her reddish coat provides camouflage against moss-covered fir trees.',
  'Shy, arboreal, solitary and crepuscular',
  'https://upload.wikimedia.org/wikipedia/commons/f/fd/Red_Panda%2C_Gentle_Tree-Dweller_of_the_Himalayas.jpg',
  'Ailurus fulgens',
  '8–14 years',
  '3.7–6.2 kg / 51–63 cm body length; ringed tail adds 28–49 cm',
  '135 days',
  'Temperate broadleaf and mixed forests with bamboo understory',
  'Eastern Himalayas and southwestern China',
  'Solitary and crepuscular; scent-marks territory',
  'Reddish-brown fur with dark underparts; bushy ringed tail; semi-retractable claws; false thumb (radial sesamoid bone) aids bamboo gripping'
),
(
  'Crag', 'Mountain Goat',
  (SELECT id FROM habitats WHERE name = 'Mountain'),
  'Herbivore',
  'Supremely sure-footed, Crag can scale near-vertical rock faces using split hooves with hard outer rims and non-slip inner pads.',
  'Agile, stoic, surefooted',
  'https://upload.wikimedia.org/wikipedia/commons/2/23/Mountain_Goat%2C_Enchantments_Basin.jpg',
  'Oreamnos americanus',
  '12–15 years',
  '45–140 kg / 90–105 cm at shoulder',
  '180 days',
  'Rocky mountain cliffs and subalpine meadows',
  'Rocky Mountains and Cascade Range, North America',
  'Small groups in winter; females and young in nursery bands; males mostly solitary outside rut',
  'White woolly double coat; both sexes bear short black horns; dewclaws and hard outer rim with soft inner hoof surface prevent slipping'
),
(
  'Talon', 'Golden Eagle',
  (SELECT id FROM habitats WHERE name = 'Mountain'),
  'Carnivore',
  'One of the most iconic raptors in the world. Talon has a wingspan approaching 2 metres and hunts with a steep stoop at up to 240 km/h.',
  'Powerful, keen-sighted, territorial',
  'https://upload.wikimedia.org/wikipedia/commons/c/cc/015_Wild_Golden_Eagle_in_flight_at_Pfyn-Finges_%28Switzerland%29_Photo_by_Giles_Laurent.jpg',
  'Aquila chrysaetos',
  '30+ years',
  '3–6.7 kg / 66–102 cm body length; wingspan 1.8–2.3 m',
  'Egg-laying; 41–45 day incubation',
  'Open mountains, hills, cliffs and upland moorland',
  'Widespread: North America, Europe, Asia and North Africa',
  'Lifelong pair bonds; large defended home ranges of 60–200 km²',
  'Dark brown plumage with golden-buff nape; talons exert over 440 N of force; eyesight up to 8x sharper than human vision'
),
(
  'Yuki', 'Yak',
  (SELECT id FROM habitats WHERE name = 'Mountain'),
  'Herbivore',
  'One of the most cold-adapted large mammals in the park. Yuki''s multilayered coat can withstand temperatures below -40 °C with ease.',
  'Hardy, docile, exceptionally cold-adapted',
  'https://upload.wikimedia.org/wikipedia/commons/7/76/Sarlyk_Yak2.jpg',
  'Bos grunniens',
  '20–25 years',
  '300–1 000 kg / 1.6–2.2 m at shoulder',
  '9 months',
  'Alpine tundra and montane grasslands above 3 000 m',
  'Tibetan Plateau and surrounding mountain ranges',
  'Small herds of females and young; adult males mostly solitary outside rut',
  'Dense layered coat (soft fine underlayer and coarse outer skirt reaching the ground); enlarged lungs and heart for high-altitude oxygen levels'
),
(
  'Atlas', 'Alpine Ibex',
  (SELECT id FROM habitats WHERE name = 'Mountain'),
  'Herbivore',
  'Atlas navigates the steep cliff faces of the mountain enclosure with confidence. The species was hunted to near-extinction by 1800 but recovered through conservation.',
  'Agile, social in season, bold climber',
  'https://upload.wikimedia.org/wikipedia/commons/9/9b/003_Wild_Alpine_Ibex_Sunset_Creux_du_Van_Mont_Racine_Photo_by_Giles_Laurent.jpg',
  'Capra ibex',
  '14–22 years',
  '67–117 kg / 75–90 cm at shoulder (males)',
  '165–170 days',
  'Rocky alpine terrain above the tree line',
  'European Alps (reintroduced after near-extinction in early 1800s)',
  'Males form bachelor herds outside rut; mixed herds form during rut season',
  'Males carry large ridged backward-curving horns up to 1 m; grey-brown coat; narrow muzzle for precise forage selection on rocky terrain'
),

-- ── TROPICAL AVIARY (5) ──────────────────────────────────────────────────────
(
  'Pearl', 'Sulphur-crested Cockatoo',
  (SELECT id FROM habitats WHERE name = 'Tropical Aviary'),
  'Herbivore',
  'Highly intelligent and extraordinarily vocal. Pearl has learned to mimic over a dozen keeper phrases and is a consistent visitor favourite.',
  'Highly intelligent, loud, extremely long-lived',
  'https://upload.wikimedia.org/wikipedia/commons/a/a9/Cacatua_galerita_Tas_2.jpg',
  'Cacatua galerita',
  '40–70 years',
  '0.8–0.9 kg / 44–55 cm',
  'Egg-laying; 25–27 day incubation',
  'Forest, woodland and urban parkland',
  'Australia and New Guinea',
  'Pair-bonded; large social flocks outside breeding season',
  'White plumage; bright yellow erectile crest; strong curved bill for cracking hard seeds; requires high cognitive enrichment'
),
(
  'Lori', 'Rainbow Lorikeet',
  (SELECT id FROM habitats WHERE name = 'Tropical Aviary'),
  'Omnivore',
  'The most colourful bird in the aviary. Lori feeds primarily on pollen and nectar using a specialised brush-tipped tongue unique among parrots.',
  'Active, noisy, highly social',
  'https://upload.wikimedia.org/wikipedia/commons/a/ad/Rainbow_lorikeet_%28Trichoglossus_moluccanus_moluccanus%29_Sydney.jpg',
  'Trichoglossus moluccanus',
  '15–25 years',
  '75–157 g / 25–30 cm',
  'Egg-laying; 22–25 day incubation',
  'Rainforest, woodland and coastal bush',
  'Eastern Australia',
  'Large gregarious flocks; monogamous pairs nest in tree hollows',
  'Multi-coloured plumage (blue head, orange breast, green back, yellow collar); brush-tipped tongue for nectar and pollen feeding'
),
(
  'Beak', 'Southern Yellow-billed Hornbill',
  (SELECT id FROM habitats WHERE name = 'Tropical Aviary'),
  'Omnivore',
  'Distinctive and entertaining, Beak spends the morning tossing food items repeatedly into the air before catching them — a learned food-handling technique.',
  'Bold, terrestrial forager, expressive',
  'https://upload.wikimedia.org/wikipedia/commons/b/b7/155_Southern_yellow-billed_hornbill_in_Etosha_National_Park_Photo_by_Giles_Laurent.jpg',
  'Tockus leucomelas',
  '20–25 years',
  '120–220 g / 48–60 cm',
  'Egg-laying; female seals herself in tree cavity during incubation (24–25 days)',
  'Open arid woodland and thornbush',
  'Southern Africa',
  'Monogamous pairs; females seal nesting cavity with mud and droppings',
  'Vivid yellow bill; white-spotted dark wings; tossing behaviour to manage prey; female imprisoned in nest is fed by male through narrow slit'
),
(
  'Echo', 'African Grey Parrot',
  (SELECT id FROM habitats WHERE name = 'Tropical Aviary'),
  'Omnivore',
  'Widely regarded as the most cognitively advanced parrot species. Echo has an active vocabulary of over 60 words used in appropriate context.',
  'Highly intelligent, sensitive, very long-lived',
  'https://upload.wikimedia.org/wikipedia/commons/3/3c/Perroquet_%C3%A0_Yampopo_Beach_-_Douala.jpg',
  'Psittacus erithacus',
  '40–60 years',
  '400–490 g / 30–36 cm',
  'Egg-laying; 28–30 day incubation',
  'Dense tropical lowland forest',
  'Central Africa',
  'Pair-bonded; roosts in large communal flocks',
  'Uniform grey plumage; bright red tail; exceptional vocal mimicry and demonstrated abstract reasoning in scientific studies'
),
(
  'Azul', 'Blue-and-yellow Macaw',
  (SELECT id FROM habitats WHERE name = 'Tropical Aviary'),
  'Omnivore',
  'Strikingly beautiful and one of the most recognisable parrots in the world. Azul is pair-bonded with Echo and the two are rarely apart.',
  'Social, vocal, intelligent',
  'https://upload.wikimedia.org/wikipedia/commons/e/ec/Ara_ararauna_Luc_Viatour.jpg',
  'Ara ararauna',
  '30–50 years',
  'Approx. 1 kg / 76–86 cm total length; wingspan up to 1 m',
  '24–28 day incubation',
  'Tropical and subtropical forest, woodland and savanna',
  'South America (Venezuela to Bolivia and Brazil)',
  'Lifelong pair bonds; large communal roost flocks',
  'Vivid blue dorsal and yellow-gold ventral plumage; bare white facial skin with black feather lines; powerful bill crushes hard palm nuts'
),

-- ── AQUATIC ZONE (5) ─────────────────────────────────────────────────────────
(
  'Leo', 'California Sea Lion',
  (SELECT id FROM habitats WHERE name = 'Aquatic Zone'),
  'Carnivore',
  'The most acrobatic resident of the aquatic zone. Leo can reach 40 km/h underwater and participates in daily keeper presentations.',
  'Highly trainable, social, fast swimmer',
  'https://upload.wikimedia.org/wikipedia/commons/3/3f/California_Sea_Lion%2C_Monterey%2C_California%2C_United_States_imported_from_iNaturalist_photo_203598492.jpg',
  'Zalophus californianus',
  '15–25 years',
  'Males up to 300 kg / 2.4 m; females up to 100 kg / 1.8 m',
  '11 months including delayed implantation',
  'Rocky coastlines and sandy beaches',
  'Pacific coast of North America',
  'Females and pups form colonies; males hold beach territories during breeding season',
  'External ear flap distinguishes sea lions from true seals; fore-flippers provide main propulsion; loud bark vocalisations used for recognition'
),
(
  'Coral', 'Clownfish',
  (SELECT id FROM habitats WHERE name = 'Aquatic Zone'),
  'Omnivore',
  'Resident of the anemone display tank. Coral has a mutualistic relationship with the host anemone — the anemone provides shelter, Coral drives away polyp-eating fish.',
  'Territorial, symbiotic, sequentially hermaphroditic',
  'https://upload.wikimedia.org/wikipedia/commons/f/f6/Clown_fish_in_the_Andaman_Coral_Reef.jpg',
  'Amphiprion ocellaris',
  '6–10 years',
  '10–18 g / 8–11 cm',
  'Egg-laying; 6–10 day incubation; male guards eggs',
  'Shallow tropical coral reefs',
  'Indo-Pacific (Indian Ocean, Red Sea and western Pacific)',
  'Breeding pair with anemone host; all individuals born male, dominant becomes female',
  'Orange body with white bars edged in black; mucus coat provides immunity to anemone stings; all juveniles are male — dominant individual transitions to female'
),
(
  'Marina', 'Green Sea Turtle',
  (SELECT id FROM habitats WHERE name = 'Aquatic Zone'),
  'Herbivore',
  'A globally significant ambassador species. Marina represents a vulnerable population and is the centrepiece of the park''s marine conservation programme.',
  'Gentle, solitary, long-distance migrant',
  'https://upload.wikimedia.org/wikipedia/commons/a/a3/Green_sea_turtle_%28Chelonia_mydas%29_Moorea.jpg',
  'Chelonia mydas',
  'Up to 80+ years',
  '68–190 kg / 83–114 cm shell length',
  'Egg-laying; 45–75 day incubation on sandy beaches',
  'Tropical and subtropical ocean waters; seagrass meadows and coral reefs',
  'Tropical and subtropical oceans worldwide',
  'Largely solitary at sea; females return to natal beach to nest every 2–5 years',
  'Named for green-coloured fat beneath shell; smooth streamlined carapace; powerful fore-flippers for open-ocean cruising; cannot retract into shell'
),
(
  'Drift', 'Moon Jellyfish',
  (SELECT id FROM habitats WHERE name = 'Aquatic Zone'),
  'Carnivore',
  'Ethereal and mesmerising, the moon jellyfish display tank is one of the most calming exhibits in the park. Drift uses specialised nematocyst cells to capture zooplankton.',
  'Passive drifter, no centralised nervous system, colonial display',
  'https://upload.wikimedia.org/wikipedia/commons/f/f9/Aurelia_aurita_%28Cnidaria%29_Luc_Viatour.jpg',
  'Aurelia aurita',
  '12–18 months as medusa; life cycle can restart under stress',
  'Bell diameter 25–40 cm; near-weightless in seawater',
  'Asexual strobilation (polyp stage) alternates with sexual reproduction (medusa stage)',
  'Open coastal and continental shelf seas',
  'Cosmopolitan: found in all major oceans',
  'Solitary medusae; open-ocean blooms can number millions of individuals',
  'Translucent bell with four horseshoe-shaped gonads; stings harmless to humans; no brain, heart or blood — simplest circulatory system of any bilateral animal'
),
(
  'Pip', 'Short-snouted Seahorse',
  (SELECT id FROM habitats WHERE name = 'Aquatic Zone'),
  'Carnivore',
  'Pip anchors to coral branches by prehensile tail and hunts by stealth, using a vacuum-strike to inhale tiny crustaceans at close range.',
  'Monogamous, slow-moving, camouflaged hunter',
  'https://upload.wikimedia.org/wikipedia/commons/2/25/Hippocampus_hippocampus_%28on_Ascophyllum_nodosum%29.jpg',
  'Hippocampus hippocampus',
  '1–4 years',
  'Up to 15 cm',
  'Male carries and gives birth; 20–28 days in brood pouch; up to 200 young per birth',
  'Shallow coastal waters, seagrass beds and coral reefs',
  'Northeastern Atlantic Ocean and Mediterranean Sea',
  'Strictly monogamous pairs; daily greeting dance reinforces bond',
  'Males carry young in brood pouch — one of very few species where males give birth; prehensile tail; dermal plates instead of scales; fused jaws'
)

ON CONFLICT (prenom, species) DO NOTHING;


-- ---------------------------------------------------------
-- 6. VISITORS (12)
-- ---------------------------------------------------------
INSERT INTO visitors (username, name, lastname) VALUES
  ('alice.m',  'Alice',   'Martin'),
  ('kevin.d',  'Kevin',   'Dubois'),
  ('sophie.r', 'Sophie',  'Robert'),
  ('amina.k',  'Amina',   'Kamara'),
  ('lucas.b',  'Lucas',   'Boyer'),
  ('emma.t',   'Emma',    'Thomas'),
  ('nora.a',   'Nora',    'Aubry'),
  ('yanis.l',  'Yanis',   'Lemoine'),
  ('claire.p', 'Claire',  'Perrin'),
  ('adil.s',   'Adil',    'Said'),
  ('ines.v',   'Ines',    'Vidal'),
  ('paul.g',   'Paul',    'Garcia')
ON CONFLICT (username) DO NOTHING;


-- ---------------------------------------------------------
-- 7. REVIEWS (12 — 11 approved, 1 pending)
-- ---------------------------------------------------------
INSERT INTO reviews (visitor_name, review, rating, review_date, approved) VALUES
  ('Alice M.',   'Beautiful zoo, very clean and well-maintained. The staff were knowledgeable and friendly throughout.',                              5, NOW() - INTERVAL '18 days', TRUE),
  ('Kevin D.',   'The Zoo Train Tour was excellent — a great way to see the whole park without exhausting the kids.',                               5, NOW() - INTERVAL '16 days', TRUE),
  ('Sophie R.',  'Wonderful family day out. The giraffes and the tropical aviary were absolute highlights for us.',                                  4, NOW() - INTERVAL '15 days', TRUE),
  ('Amina K.',   'Very atmospheric habitats. The savanna enclosure genuinely feels immersive. Snack area was a bit crowded at lunchtime.',          4, NOW() - INTERVAL '14 days', TRUE),
  ('Lucas B.',   'My children were captivated by the penguin feeding presentation. Fantastic educational content from the keeper.',                 5, NOW() - INTERVAL '12 days', TRUE),
  ('Emma T.',    'Good experience overall. The aquatic zone was stunning. Clearer directional signage between habitats would help.',                 4, NOW() - INTERVAL '11 days', TRUE),
  ('Nora A.',    'The habitats feel very natural and spacious. Paths are wide and easy to navigate. We will definitely return.',                     5, NOW() - INTERVAL '10 days', TRUE),
  ('Yanis L.',   'I did not expect to enjoy the desert enclosure so much — the anaconda and the sidewinder are fascinating up close.',              5, NOW() - INTERVAL '8 days',  TRUE),
  ('Claire P.',  'Friendly staff and an effortless online booking process. The VIP Behind the Scenes tour exceeded every expectation.',              4, NOW() - INTERVAL '7 days',  TRUE),
  ('Adil S.',    'The Night Safari was genuinely unique. Seeing the tundra animals in near-darkness was a memorable experience.',                   5, NOW() - INTERVAL '6 days',  TRUE),
  ('Ines V.',    'Every exhibit had clear educational information. Ideal for school trips. The Junior Zookeeper Workshop was brilliantly run.',      5, NOW() - INTERVAL '5 days',  TRUE),
  ('Paul G.',    'Great visit overall but the car park fills up very quickly on weekend mornings. Recommend arriving before 10h00.',                 4, NOW() - INTERVAL '3 days',  FALSE)
ON CONFLICT DO NOTHING;


-- ---------------------------------------------------------
-- 8. BOOKINGS (12)
-- ---------------------------------------------------------
INSERT INTO bookings (visitor_username, service_id, booking_date, status) VALUES
  ('alice.m',  (SELECT id FROM services WHERE name = 'Guided Tour'),                  CURRENT_DATE + 2,  'Confirmed'),
  ('kevin.d',  (SELECT id FROM services WHERE name = 'Night Safari'),                 CURRENT_DATE + 4,  'Pending'),
  ('sophie.r', (SELECT id FROM services WHERE name = 'Animal Encounter'),             CURRENT_DATE + 1,  'Confirmed'),
  ('amina.k',  (SELECT id FROM services WHERE name = 'Junior Zookeeper Workshop'),    CURRENT_DATE + 3,  'Confirmed'),
  ('lucas.b',  (SELECT id FROM services WHERE name = 'Zoo Train Tour'),               CURRENT_DATE + 5,  'Pending'),
  ('emma.t',   (SELECT id FROM services WHERE name = 'Rainforest Cafe'),              CURRENT_DATE + 6,  'Confirmed'),
  ('nora.a',   (SELECT id FROM services WHERE name = 'Animal Encounter'),             CURRENT_DATE + 2,  'Confirmed'),
  ('yanis.l',  (SELECT id FROM services WHERE name = 'Guided Tour'),                  CURRENT_DATE + 3,  'Pending'),
  ('claire.p', (SELECT id FROM services WHERE name = 'VIP Behind the Scenes'),        CURRENT_DATE + 7,  'Confirmed'),
  ('adil.s',   (SELECT id FROM services WHERE name = 'Night Safari'),                 CURRENT_DATE + 1,  'Confirmed'),
  ('ines.v',   (SELECT id FROM services WHERE name = 'Junior Zookeeper Workshop'),    CURRENT_DATE + 9,  'Pending'),
  ('paul.g',   (SELECT id FROM services WHERE name = 'Zoo Train Tour'),               CURRENT_DATE + 10, 'Cancelled')
ON CONFLICT DO NOTHING;


-- ---------------------------------------------------------
-- 9. CONTACT SUBMISSIONS (6 — fictional, no real personal data)
-- ---------------------------------------------------------
INSERT INTO contact_submissions (name, email, phone, subject, message, created_at) VALUES
  ('Laura Benoit',     'laura.benoit@example.com',     '+33 6 11 22 33 44', 'School visit inquiry',    'We would like to organise a group visit for 28 primary school students next month. Could you provide group pricing details?',   NOW() - INTERVAL '12 days'),
  ('Mathieu Caron',    'mathieu.caron@example.com',    '+33 6 22 33 44 55', 'Lost item',               'My daughter may have left a blue backpack near the tropical aviary on Saturday afternoon. Is there a lost property office?', NOW() - INTERVAL '9 days'),
  ('Sana El Idrissi',  'sana.elidrissi@example.com',   '+33 6 33 44 55 66', 'Accessibility question',  'Can manual or electric wheelchairs be rented on site? We are visiting with an elderly family member.',                         NOW() - INTERVAL '8 days'),
  ('Romain Dufour',    'romain.dufour@example.com',    '+33 6 44 55 66 77', 'Birthday event',          'Do you offer birthday packages for children? My son turns 8 in six weeks and is passionate about big cats.',                  NOW() - INTERVAL '7 days'),
  ('Helene Marchal',   'helene.marchal@example.com',   NULL,                'Opening hours',           'Are you open on French public holidays? We are planning a visit over the Toussaint weekend.',                                NOW() - INTERVAL '5 days'),
  ('Idriss Konate',    'idriss.konate@example.com',    '+33 6 55 66 77 88', 'Partnership request',     'Our local tourism bureau is interested in exploring a joint promotional partnership for the summer season.',                  NOW() - INTERVAL '3 days')
ON CONFLICT DO NOTHING;


-- ---------------------------------------------------------
-- 10. VETERINARY REPORTS (10 — using vet1 and vet2)
-- ---------------------------------------------------------
INSERT INTO veterinary_reports (
  animal_id, vet_username, report_date,
  health_status, treatment, weight_at_checkup, follow_up_date, habitat_comments
) VALUES
  (
    (SELECT id FROM animals WHERE prenom = 'Kofi'   AND species = 'Panthera leo'),
    'vet1', CURRENT_DATE - 20, 'Stable',
    'Routine examination completed. Coat condition excellent. Dental wear normal for age.',
    191.00, CURRENT_DATE + 90,
    'Savanna enclosure fencing and shaded resting area in good condition. No maintenance required.'
  ),
  (
    (SELECT id FROM animals WHERE prenom = 'Nia'    AND species = 'Loxodonta africana'),
    'vet2', CURRENT_DATE - 18, 'Good',
    'Foot pad inspection and moisturising care applied to all four feet. No cracks or infections observed.',
    5120.00, CURRENT_DATE + 45,
    'Mud wallow and water access adequate. Substrate in foot-care zone should be kept damp.'
  ),
  (
    (SELECT id FROM animals WHERE prenom = 'Twiga'  AND species = 'Giraffa camelopardalis'),
    'vet1', CURRENT_DATE - 16, 'Stable',
    'Routine checkup completed. Mild skin dryness at base of ossicones treated with topical emollient.',
    803.00, CURRENT_DATE + 60,
    'Feeding platform height remains appropriate. No structural concerns.'
  ),
  (
    (SELECT id FROM animals WHERE prenom = 'Shadow' AND species = 'Panthera onca'),
    'vet2', CURRENT_DATE - 14, 'Under observation',
    'Reduced food intake over 4 days. Blood panel taken — results pending. Enrichment schedule adjusted.',
    88.50, CURRENT_DATE + 14,
    'Quiet buffer zone should be maintained at the visitor viewing area during peak hours until appetite normalises.'
  ),
  (
    (SELECT id FROM animals WHERE prenom = 'Nanook' AND species = 'Ursus maritimus'),
    'vet1', CURRENT_DATE - 12, 'Stable',
    'Routine dental and coat inspection. Minor tooth tartar addressed. Pool behaviour and swim distance normal.',
    449.00, CURRENT_DATE + 75,
    'Pool cooling system functioning correctly. Water temperature holding at 8 °C as specified.'
  ),
  (
    (SELECT id FROM animals WHERE prenom = 'Ghost'  AND species = 'Panthera uncia'),
    'vet2', CURRENT_DATE - 10, 'Good',
    'Minor muscle stiffness in right hindquarter noted after increased climbing activity. Short anti-inflammatory course prescribed.',
    41.80, CURRENT_DATE + 21,
    'Rock climbing structures remain structurally sound and dry. Keeper to monitor activity levels.'
  ),
  (
    (SELECT id FROM animals WHERE prenom = 'Gator'  AND species = 'Alligator mississippiensis'),
    'vet1', CURRENT_DATE - 8, 'Stable',
    'External parasite inspection completed — no ectoparasites found. Basking behaviour normal. Weight stable.',
    195.00, CURRENT_DATE + 90,
    'Water filtration and temperature system fully operational. Basking platform substrate adequate.'
  ),
  (
    (SELECT id FROM animals WHERE prenom = 'Bumi'   AND species = 'Pongo pygmaeus'),
    'vet2', CURRENT_DATE - 6, 'Good',
    'Annual health screen completed. Blood values within normal range. Eye and ear inspection clear. Enrichment engagement high.',
    74.20, CURRENT_DATE + 180,
    'Climbing structures and nesting material in good condition. Canopy access fully operational.'
  ),
  (
    (SELECT id FROM animals WHERE prenom = 'Sable'  AND species = 'Camelus dromedarius'),
    'vet1', CURRENT_DATE - 4, 'Stable',
    'Hoof trimming and sole inspection completed. No lameness. Hump firmness indicates adequate fat reserve.',
    548.00, CURRENT_DATE + 90,
    'Desert substrate dry and deep. Shade structure providing adequate afternoon cover.'
  ),
  (
    (SELECT id FROM animals WHERE prenom = 'Leo'    AND species = 'Zalophus californianus'),
    'vet2', CURRENT_DATE - 2, 'Good',
    'Annual health assessment completed. Flipper condition excellent. Vision test normal. Body condition score optimal.',
    198.00, CURRENT_DATE + 180,
    'Pool water quality within parameters. Non-slip poolside surface requires inspection in sector B next maintenance cycle.'
  )
ON CONFLICT DO NOTHING;


-- ---------------------------------------------------------
-- 11. FEEDING RECORDS (20)
-- ---------------------------------------------------------
INSERT INTO feeding_records (animal_id, meal_preparation, weight, feeding_time) VALUES
  ((SELECT id FROM animals WHERE prenom = 'Kofi'   AND species = 'Panthera leo'),        '4.5 kg whole beef with added vitamin E supplement',                             4.50,  NOW() - INTERVAL '10 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Twiga'  AND species = 'Giraffa camelopardalis'), 'Acacia branch bundle, browse mix and compressed pellet ration',               18.00, NOW() - INTERVAL '9 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Nia'    AND species = 'Loxodonta africana'),   'Hay bale (12 kg), apples, carrots, sweet potato, leafy greens (50 kg total)',  62.00, NOW() - INTERVAL '8 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Tusker' AND species = 'Phacochoerus africanus'),'Grass, root vegetables, fruit mix and mineral block',                          3.20,  NOW() - INTERVAL '8 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Shadow' AND species = 'Panthera onca'),        '3 kg rabbit carcass (reduced ration — under appetite observation)',             3.00,  NOW() - INTERVAL '7 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Howl'   AND species = 'Alouatta seniculus'),   'Leafy browse, tropical fruit selection and mineral dusting',                    1.80,  NOW() - INTERVAL '7 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Bumi'   AND species = 'Pongo pygmaeus'),       'Mixed fruit, vegetables, boiled eggs, forage enrichment scatter',               4.50,  NOW() - INTERVAL '6 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Gator'  AND species = 'Alligator mississippiensis'), 'Whole tilapia and poultry portions (fed three times per week)',           7.00,  NOW() - INTERVAL '6 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Swampy' AND species = 'Trichechus manatus'),   'Aquatic plant mix, lettuce, water hyacinth (30 kg)',                           30.00, NOW() - INTERVAL '5 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Rosa'   AND species = 'Phoenicopterus roseus'), 'Brine shrimp suspension with beta-carotene supplement',                       0.60,  NOW() - INTERVAL '5 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Nanook' AND species = 'Ursus maritimus'),      'Herring, capelin and cod with fish oil supplement — presented in enrichment ice blocks', 14.00, NOW() - INTERVAL '11 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Blizzard' AND species = 'Vulpes lagopus'),     'Rodent prey, mixed berries and supplemented protein paste',                    0.85,  NOW() - INTERVAL '10 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Frost'  AND species = 'Spheniscus humboldti'), 'Fresh sardines and capelin (individually weighed and ID-tagged per bird)',      1.20,  NOW() - INTERVAL '9 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Sable'  AND species = 'Camelus dromedarius'), 'Dry forage hay, chopped root vegetables, mineral salt lick',                   22.00, NOW() - INTERVAL '8 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Mira'   AND species = 'Suricata suricatta'),   'Mealworms, eggs, chopped vegetables and calcium supplement',                   0.35,  NOW() - INTERVAL '7 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Ghost'  AND species = 'Panthera uncia'),       '2.5 kg meat ration (goat) with bone-in for dental enrichment',                 2.50,  NOW() - INTERVAL '7 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Ruki'   AND species = 'Ailurus fulgens'),      'Fresh bamboo shoots (1 kg), apple slices, specialist pellet biscuits',         1.15,  NOW() - INTERVAL '6 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Talon'  AND species = 'Aquila chrysaetos'),    'Whole rabbit — presented as enrichment on elevated perch',                     1.20,  NOW() - INTERVAL '5 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Azul'   AND species = 'Ara ararauna'),         'Tropical fruit selection, palm nuts, sprouted seeds and mineral grit',         0.48,  NOW() - INTERVAL '4 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Leo'    AND species = 'Zalophus californianus'), 'Fresh herring and mackerel (hand-fed during morning presentation)',           5.50,  NOW() - INTERVAL '3 hours')
ON CONFLICT DO NOTHING;


-- ---------------------------------------------------------
-- 12. ANIMAL CLICKS — analytics (15 popular animals)
-- ---------------------------------------------------------
INSERT INTO animal_clicks (animal_id, click_count, animal_name, first_click, last_click) VALUES
  ((SELECT id FROM animals WHERE prenom = 'Kofi'    AND species = 'Panthera leo'),          142, 'Kofi',    NOW() - INTERVAL '60 days', NOW() - INTERVAL '2 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Nanook'  AND species = 'Ursus maritimus'),        138, 'Nanook',  NOW() - INTERVAL '58 days', NOW() - INTERVAL '3 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Nia'     AND species = 'Loxodonta africana'),     131, 'Nia',     NOW() - INTERVAL '57 days', NOW() - INTERVAL '1 day'),
  ((SELECT id FROM animals WHERE prenom = 'Ghost'   AND species = 'Panthera uncia'),         124, 'Ghost',   NOW() - INTERVAL '55 days', NOW() - INTERVAL '4 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Twiga'   AND species = 'Giraffa camelopardalis'), 119, 'Twiga',   NOW() - INTERVAL '54 days', NOW() - INTERVAL '9 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Frost'   AND species = 'Spheniscus humboldti'),   107, 'Frost',   NOW() - INTERVAL '52 days', NOW() - INTERVAL '5 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Shadow'  AND species = 'Panthera onca'),           98, 'Shadow',  NOW() - INTERVAL '50 days', NOW() - INTERVAL '6 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Bumi'    AND species = 'Pongo pygmaeus'),           94, 'Bumi',    NOW() - INTERVAL '49 days', NOW() - INTERVAL '7 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Azul'    AND species = 'Ara ararauna'),             88, 'Azul',    NOW() - INTERVAL '47 days', NOW() - INTERVAL '8 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Duma'    AND species = 'Acinonyx jubatus'),         85, 'Duma',    NOW() - INTERVAL '45 days', NOW() - INTERVAL '11 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Ruki'    AND species = 'Ailurus fulgens'),          82, 'Ruki',    NOW() - INTERVAL '44 days', NOW() - INTERVAL '12 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Leo'     AND species = 'Zalophus californianus'),   79, 'Leo',     NOW() - INTERVAL '42 days', NOW() - INTERVAL '5 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Blizzard'AND species = 'Vulpes lagopus'),           74, 'Blizzard',NOW() - INTERVAL '40 days', NOW() - INTERVAL '6 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Tusker'  AND species = 'Phacochoerus africanus'),   68, 'Tusker',  NOW() - INTERVAL '38 days', NOW() - INTERVAL '14 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Kondo'   AND species = 'Gorilla gorilla'),          63, 'Kondo',   NOW() - INTERVAL '35 days', NOW() - INTERVAL '9 hours')
ON CONFLICT (animal_id) DO UPDATE SET
  click_count = EXCLUDED.click_count,
  animal_name = EXCLUDED.animal_name,
  last_click  = EXCLUDED.last_click;
