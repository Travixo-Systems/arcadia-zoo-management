-- Arcadia Zoo V2 - Rich Seed Data
-- Run this AFTER schema.sql in your Supabase SQL Editor

-- ============================================
-- HABITATS (update with images)
-- ============================================
UPDATE habitats SET image_url = 'https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=800&q=80' WHERE name = 'Savanna';
UPDATE habitats SET image_url = 'https://images.unsplash.com/photo-1440342359743-84fcb8c21f21?w=800&q=80' WHERE name = 'Jungle';
UPDATE habitats SET image_url = 'https://images.unsplash.com/photo-1462275646964-a0e3c11f18a6?w=800&q=80' WHERE name = 'Arctic';

-- ============================================
-- SAVANNA ANIMALS (habitat_id = 1)
-- ============================================
INSERT INTO animals (prenom, race, habitat_id, diet, description, characteristics, image_url, species, lifespan, size_weight, gestation, natural_habitat, native_region, lifestyle, distinctive_features)
VALUES
(
  'Simba',
  'Mammalia, Carnivora, Felidae',
  (SELECT id FROM habitats WHERE name = 'Savanna'),
  'Carnivore',
  'Simba is our majestic male lion and the undisputed king of the Savanna enclosure. With his impressive golden mane and powerful build, he commands attention from every visitor.',
  'Powerful build, golden mane, retractable claws, excellent night vision',
  'https://images.unsplash.com/photo-1546182990-dffeafbe841d?w=800&q=80',
  'Panthera leo',
  '10-14 years in the wild, up to 20 in captivity',
  'Height: 1.2m at shoulder | Weight: 190 kg',
  '110 days',
  'Grasslands, savannas, and open woodlands',
  'Sub-Saharan Africa',
  'Lions are the only truly social cats, living in groups called prides. Simba spends his mornings patrolling his territory and afternoons resting in the shade. He is most active during feeding times and at dusk.',
  'His dark, full mane indicates excellent health and dominance. Simba has a distinctive scar above his left eye from a playful encounter as a cub.'
),
(
  'Nala',
  'Mammalia, Carnivora, Felidae',
  (SELECT id FROM habitats WHERE name = 'Savanna'),
  'Carnivore',
  'Nala is our graceful lioness and the real hunter of the pride. She is fast, agile, and fiercely protective of her territory.',
  'Sleek build, tawny coat, exceptional speed and agility',
  'https://images.unsplash.com/photo-1614027164847-1b28cfe1df60?w=800&q=80',
  'Panthera leo',
  '10-14 years in the wild, up to 20 in captivity',
  'Height: 1.1m at shoulder | Weight: 130 kg',
  '110 days',
  'Grasslands, savannas, and open woodlands',
  'Sub-Saharan Africa',
  'Nala is the primary hunter and often leads coordinated hunts during enrichment activities. She is social and curious, frequently approaching the viewing glass to observe visitors.',
  'Nala has unusually bright amber eyes and a calm, observant demeanor that distinguishes her from other lionesses.'
),
(
  'Tembo',
  'Mammalia, Proboscidea, Elephantidae',
  (SELECT id FROM habitats WHERE name = 'Savanna'),
  'Herbivore',
  'Tembo is our gentle giant African elephant. At over 3 meters tall, he is the largest animal in the zoo and a favorite among families.',
  'Enormous size, long trunk, large ears, thick grey skin, tusks',
  'https://images.unsplash.com/photo-1557050543-4d5f4e07ef46?w=800&q=80',
  'Loxodonta africana',
  '60-70 years',
  'Height: 3.3m at shoulder | Weight: 6,000 kg',
  '22 months',
  'Savannas, forests, deserts, and marshes',
  'Sub-Saharan Africa',
  'Tembo is incredibly intelligent and has learned over 20 commands from his keepers. He loves water and can often be seen spraying himself with his trunk. He consumes about 150 kg of food daily.',
  'Tembo has distinctively large, fan-shaped ears and a notch on his right ear. He is known for his gentle temperament with keepers and other animals.'
),
(
  'Twiga',
  'Mammalia, Artiodactyla, Giraffidae',
  (SELECT id FROM habitats WHERE name = 'Savanna'),
  'Herbivore',
  'Twiga is our tallest resident, a beautiful Masai giraffe with unique spot patterns. She gracefully towers over all other animals in the Savanna.',
  'Extremely tall, long neck, distinctive spot pattern, long prehensile tongue',
  'https://images.unsplash.com/photo-1547721064-da6cfb341d50?w=800&q=80',
  'Giraffa tippelskirchi',
  '25 years in the wild, up to 30 in captivity',
  'Height: 5.5m | Weight: 800 kg',
  '15 months',
  'Open woodlands and savannas',
  'East Africa (Kenya, Tanzania)',
  'Twiga spends most of her day browsing treetops that no other animal can reach. She sleeps only 30 minutes a day in short naps. Her 45 cm tongue helps her strip leaves from thorny acacia branches.',
  'Each giraffe has a unique spot pattern like a fingerprint. Twiga has a heart-shaped spot cluster on her left flank that makes her instantly recognizable.'
),
(
  'Zuri',
  'Mammalia, Perissodactyla, Rhinocerotidae',
  (SELECT id FROM habitats WHERE name = 'Savanna'),
  'Herbivore',
  'Zuri is our critically endangered white rhinoceros. She is part of an international breeding program to help save her species from extinction.',
  'Massive body, two horns, thick armored skin, wide square lip',
  'https://images.unsplash.com/photo-1598894000396-bc30e0996899?w=800&q=80',
  'Ceratotherium simum',
  '40-50 years',
  'Height: 1.8m at shoulder | Weight: 2,300 kg',
  '16 months',
  'Grasslands and savannas',
  'Southern and Eastern Africa',
  'Despite her size, Zuri is surprisingly gentle. She enjoys mud baths which protect her skin from sunburn and parasites. She has a symbiotic relationship with oxpecker birds that clean her skin.',
  'Zuri''s name means "beautiful" in Swahili. Her front horn measures 60 cm, and she has a distinctive fold pattern on her neck that keepers use to identify her.'
);

-- ============================================
-- JUNGLE ANIMALS (habitat_id = 2)
-- ============================================
INSERT INTO animals (prenom, race, habitat_id, diet, description, characteristics, image_url, species, lifespan, size_weight, gestation, natural_habitat, native_region, lifestyle, distinctive_features)
VALUES
(
  'Raja',
  'Mammalia, Carnivora, Felidae',
  (SELECT id FROM habitats WHERE name = 'Jungle'),
  'Carnivore',
  'Raja is our magnificent Bengal tiger, the crown jewel of the Jungle habitat. His striking orange coat with black stripes makes him one of the most photographed animals at the zoo.',
  'Powerful muscular build, orange coat with black stripes, white underbelly',
  'https://images.unsplash.com/photo-1561731216-c3a4d99437d5?w=800&q=80',
  'Panthera tigris tigris',
  '10-15 years in the wild, up to 20 in captivity',
  'Length: 3m (incl. tail) | Weight: 220 kg',
  '104 days',
  'Tropical forests, mangrove swamps, and grasslands',
  'Indian subcontinent',
  'Raja is a solitary and territorial animal. He patrols his enclosure regularly and is most active at dawn and dusk. He is an excellent swimmer and enjoys lounging in his pool during warm days.',
  'Raja has an unusually symmetrical stripe pattern and a distinctive "M" marking on his forehead. His stripes are as unique as human fingerprints.'
),
(
  'Koko',
  'Mammalia, Primates, Hominidae',
  (SELECT id FROM habitats WHERE name = 'Jungle'),
  'Omnivore',
  'Koko is our silverback western lowland gorilla and the leader of our gorilla family. He is incredibly intelligent, gentle with his group, and endlessly fascinating to watch.',
  'Massive build, silver-grey back, dark face, intelligent eyes',
  'https://images.unsplash.com/photo-1564349683136-77e08dba1ef7?w=800&q=80',
  'Gorilla gorilla gorilla',
  '35-40 years in the wild, up to 50 in captivity',
  'Height: 1.7m standing | Weight: 180 kg',
  '8.5 months',
  'Tropical and subtropical forests',
  'Central and West Africa',
  'Koko leads a family group of 6 gorillas. He communicates through over 25 distinct vocalizations and uses tools during enrichment activities. He is protective but gentle, often seen playing with younger gorillas.',
  'The silver coloring on his back signifies his maturity and leadership status. Koko has a distinctive nose print (unique to each gorilla) and a calm, contemplative gaze.'
),
(
  'Jade',
  'Reptilia, Squamata, Pythonidae',
  (SELECT id FROM habitats WHERE name = 'Jungle'),
  'Carnivore',
  'Jade is our stunning green tree python. Her vivid emerald color and elegant coiled posture on branches make her a mesmerizing sight in our reptile section.',
  'Bright green scales, prehensile tail, heat-sensing pits, slender build',
  'https://images.unsplash.com/photo-1531386151447-fd76ad50012f?w=800&q=80',
  'Morelia viridis',
  '15-20 years',
  'Length: 1.8m | Weight: 1.6 kg',
  'Egg-laying: 25-30 eggs, 50 day incubation',
  'Tropical rainforests, canopy layer',
  'New Guinea, Indonesia, and Cape York (Australia)',
  'Jade spends almost her entire life in the trees, rarely descending to the ground. She hunts by draping herself over a branch and striking at passing prey with lightning speed. She is most active at night.',
  'Jade was actually bright red as a juvenile — green tree pythons undergo a dramatic color change as they mature. She has a distinctive row of white scales along her spine.'
),
(
  'Coco',
  'Aves, Psittaciformes, Cacatuidae',
  (SELECT id FROM habitats WHERE name = 'Jungle'),
  'Herbivore',
  'Coco is our playful and vocal sulphur-crested cockatoo. She greets visitors with head bobs and can mimic several words and sounds, making her one of the most interactive animals in the zoo.',
  'White plumage, yellow crest, curved beak, highly intelligent',
  'https://images.unsplash.com/photo-1552728089-57bdde30beb3?w=800&q=80',
  'Cacatua galerita',
  '20-40 years in the wild, up to 70 in captivity',
  'Length: 50 cm | Weight: 900 g',
  'Egg incubation: 30 days',
  'Tropical and subtropical forests, woodland edges',
  'Australia, New Guinea, Indonesia',
  'Coco is extremely social and thrives on interaction. She can solve simple puzzles, dance to music, and has a vocabulary of about 15 words. She raises her yellow crest when excited or alarmed.',
  'Coco can raise and lower her bright yellow crest to express emotions. She has an unusually large vocabulary for her species and will say "hello" to visitors who make eye contact.'
),
(
  'Mowgli',
  'Mammalia, Carnivora, Ursidae',
  (SELECT id FROM habitats WHERE name = 'Jungle'),
  'Omnivore',
  'Mowgli is our Malayan sun bear, the smallest bear species in the world. Despite his small size, he has a huge personality and loves climbing and foraging for honey.',
  'Small compact body, short black fur, distinctive chest patch, long tongue',
  'https://images.unsplash.com/photo-1589656966895-2f33e7653571?w=800&q=80',
  'Helarctos malayanus',
  '25 years in captivity',
  'Height: 70 cm at shoulder | Weight: 45 kg',
  '95 days',
  'Tropical lowland forests',
  'Southeast Asia',
  'Mowgli is an excellent climber and spends much of his time in the canopy platforms of his enclosure. He uses his extraordinarily long tongue (25 cm) to extract honey and insects. He is most active in the morning.',
  'Mowgli has a unique golden crescent-shaped chest patch — no two sun bears have the same marking. His long curved claws make him one of the best climbers in the bear family.'
);

-- ============================================
-- ARCTIC ANIMALS (habitat_id = 3)
-- ============================================
INSERT INTO animals (prenom, race, habitat_id, diet, description, characteristics, image_url, species, lifespan, size_weight, gestation, natural_habitat, native_region, lifestyle, distinctive_features)
VALUES
(
  'Aurora',
  'Mammalia, Carnivora, Ursidae',
  (SELECT id FROM habitats WHERE name = 'Arctic'),
  'Carnivore',
  'Aurora is our magnificent polar bear and the star of the Arctic habitat. Named after the Northern Lights, she is powerful, playful, and endlessly entertaining as she dives and swims in her pool.',
  'Massive white-furred body, powerful limbs, large paws, black nose',
  'https://images.unsplash.com/photo-1589656966895-2f33e7653571?w=800&q=80',
  'Ursus maritimus',
  '25-30 years',
  'Height: 1.6m at shoulder | Weight: 350 kg',
  '8 months (including delayed implantation)',
  'Sea ice, coastal areas, and Arctic tundra',
  'Arctic Circle (Canada, Russia, Norway, Greenland, Alaska)',
  'Aurora is a powerful swimmer and can often be seen diving for enrichment toys in her deep pool. She is most active in cooler weather and has a playful habit of sliding on ice blocks her keepers provide.',
  'Aurora has a distinctively cream-colored coat (polar bear fur is actually transparent, not white). She has a small notch in her left ear and an incredibly gentle temperament during training sessions.'
),
(
  'Tux',
  'Aves, Sphenisciformes, Spheniscidae',
  (SELECT id FROM habitats WHERE name = 'Arctic'),
  'Carnivore (Fish)',
  'Tux is the boldest of our emperor penguin colony. He waddles right up to the viewing glass and seems genuinely curious about the humans watching him. A visitor favorite!',
  'Tall upright posture, black and white plumage, yellow-orange ear patches',
  'https://images.unsplash.com/photo-1551986782-d0169b3f8fa7?w=800&q=80',
  'Aptenodytes forsteri',
  '15-20 years in the wild, up to 30 in captivity',
  'Height: 1.1m | Weight: 35 kg',
  'Egg incubation: 65 days (by the male)',
  'Antarctic sea ice and surrounding cold waters',
  'Antarctica',
  'Tux lives with a colony of 12 penguins. He is an incredible swimmer, reaching speeds of 9 km/h underwater. He participates in daily feeding shows where visitors can watch him catch fish mid-dive.',
  'Tux has exceptionally bright orange ear patches compared to others in the colony. He is the first penguin to approach keepers at feeding time and has a distinctive upright waddle.'
),
(
  'Frost',
  'Mammalia, Carnivora, Canidae',
  (SELECT id FROM habitats WHERE name = 'Arctic'),
  'Omnivore',
  'Frost is our beautiful Arctic fox, sporting a thick white winter coat that turns grey-brown in summer. She is quick, clever, and incredibly well-adapted to cold environments.',
  'Small compact body, thick white fur, bushy tail, short rounded ears',
  'https://images.unsplash.com/photo-1516728778615-2d590ea1855e?w=800&q=80',
  'Vulpes lagopus',
  '3-6 years in the wild, up to 14 in captivity',
  'Length: 55 cm (body) | Weight: 3.5 kg',
  '52 days',
  'Arctic tundra and coastal areas',
  'Circumpolar Arctic regions',
  'Frost is incredibly agile and playful. She loves to pounce on hidden food items in the snow — a hunting technique called "mousing." Her thick fur keeps her warm even at -50C, and she changes coat color with the seasons.',
  'Frost''s fur changes from pure white in winter to brown-grey in summer — one of the most dramatic seasonal transformations in the animal kingdom. She has unusually bright blue eyes.'
),
(
  'Nanook',
  'Mammalia, Carnivora, Phocidae',
  (SELECT id FROM habitats WHERE name = 'Arctic'),
  'Carnivore (Fish)',
  'Nanook is our playful harp seal. With his spotted silver coat and enormous dark eyes, he charms every visitor. He loves performing barrel rolls in the water during feeding time.',
  'Streamlined body, silver-grey spotted coat, large dark eyes, whiskers',
  'https://images.unsplash.com/photo-1580993741002-0522e7470ef2?w=800&q=80',
  'Pagophilus groenlandicus',
  '20-30 years',
  'Length: 1.7m | Weight: 130 kg',
  '11.5 months (including delayed implantation)',
  'North Atlantic and Arctic Ocean sea ice',
  'North Atlantic and Arctic regions',
  'Nanook is an expert swimmer who can hold his breath for up to 20 minutes and dive to 300 meters. He is very social and vocal, producing a variety of calls. He is trained for voluntary health checks.',
  'Nanook has a distinctive horseshoe-shaped marking on his back typical of adult harp seals. His large dark eyes are adapted for seeing underwater in low light conditions.'
),
(
  'Blizzard',
  'Mammalia, Artiodactyla, Bovidae',
  (SELECT id FROM habitats WHERE name = 'Arctic'),
  'Herbivore',
  'Blizzard is our imposing musk ox, built like a tank with a thick woolly coat that hangs nearly to the ground. He looks like he walked straight out of the Ice Age.',
  'Stocky build, long shaggy coat, curved horns, shoulder hump',
  'https://images.unsplash.com/photo-1606567595334-d39972c85dbe?w=800&q=80',
  'Ovibos moschatus',
  '12-20 years',
  'Height: 1.5m at shoulder | Weight: 400 kg',
  '8 months',
  'Arctic tundra and frozen landscapes',
  'Greenland, Arctic Canada, Alaska, Siberia',
  'Blizzard is a herd animal and lives with two other musk oxen. When threatened, they form a defensive circle — a behavior dating back to the Ice Age. His underwool (qiviut) is 8 times warmer than sheep wool.',
  'Blizzard''s curved horns form a distinctive "boss" across his forehead. His outer guard hairs reach nearly to the ground, giving him a prehistoric appearance that fascinates visitors.'
);

-- ============================================
-- VISITOR REVIEWS (pre-approved)
-- ============================================
INSERT INTO reviews (visitor_name, review, rating, review_date, approved)
VALUES
  ('Marie Dupont', 'Absolutely wonderful experience! The Savanna habitat was breathtaking and seeing Tembo the elephant up close was unforgettable. The kids loved every minute.', 5, NOW() - INTERVAL '2 days', true),
  ('Jean-Pierre Martin', 'Great zoo with well-maintained habitats. Raja the tiger was magnificent. Only wish there were more food options near the Arctic exhibit.', 4, NOW() - INTERVAL '5 days', true),
  ('Sophie Laurent', 'We visited on a rainy day and it was still amazing! The penguin feeding show with Tux was the highlight. Staff were friendly and knowledgeable.', 5, NOW() - INTERVAL '8 days', true),
  ('Thomas Bernard', 'Beautiful zoo with a real focus on conservation. Loved learning about Zuri the rhino and the breeding program. Very educational for children.', 5, NOW() - INTERVAL '12 days', true),
  ('Claire Moreau', 'Spent the whole day here and did not get bored. The jungle section with Koko the gorilla was incredible. Highly recommend the guided safari tour!', 5, NOW() - INTERVAL '15 days', true),
  ('Lucas Petit', 'Nice zoo, good variety of animals. The Arctic section was really well done. Frost the Arctic fox was adorable! Would definitely come back.', 4, NOW() - INTERVAL '20 days', true);
