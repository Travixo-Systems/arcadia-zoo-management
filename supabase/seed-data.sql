-- =========================================================
-- ARCADIA ZOO MANAGEMENT V2
-- EXPANDED SEED DATA PACK
-- Run AFTER schema.sql in Supabase SQL Editor
-- =========================================================
-- All unique constraints (habitats.name, services.name,
-- animals(prenom,species), contact_info.type) are defined
-- in schema.sql so ON CONFLICT works correctly here.

-- ---------------------------------------------------------
-- USERS
-- password hash = bcrypt of 'admin123' (demo accounts only)
-- ---------------------------------------------------------
INSERT INTO users (username, password, name, lastname, age) VALUES
  ('admin', '$2a$10$rQEY7gBFpHJnEqJ.6fZGxOuJiYkB2xwLfG2k5q8XqO.uVpQV5dPi', 'Admin', 'Zoo', 30),
  ('vet_marie', '$2a$10$rQEY7gBFpHJnEqJ.6fZGxOuJiYkB2xwLfG2k5q8XqO.uVpQV5dPi', 'Marie', 'Lefevre', 41),
  ('vet_thomas', '$2a$10$rQEY7gBFpHJnEqJ.6fZGxOuJiYkB2xwLfG2k5q8XqO.uVpQV5dPi', 'Thomas', 'Girard', 38),
  ('emp_luc', '$2a$10$rQEY7gBFpHJnEqJ.6fZGxOuJiYkB2xwLfG2k5q8XqO.uVpQV5dPi', 'Luc', 'Moreau', 29),
  ('emp_sarah', '$2a$10$rQEY7gBFpHJnEqJ.6fZGxOuJiYkB2xwLfG2k5q8XqO.uVpQV5dPi', 'Sarah', 'Petit', 33),
  ('emp_nina', '$2a$10$rQEY7gBFpHJnEqJ.6fZGxOuJiYkB2xwLfG2k5q8XqO.uVpQV5dPi', 'Nina', 'Bernard', 27),
  ('emp_hugo', '$2a$10$rQEY7gBFpHJnEqJ.6fZGxOuJiYkB2xwLfG2k5q8XqO.uVpQV5dPi', 'Hugo', 'Roux', 31),
  ('emp_lea', '$2a$10$rQEY7gBFpHJnEqJ.6fZGxOuJiYkB2xwLfG2k5q8XqO.uVpQV5dPi', 'Lea', 'Fontaine', 26)
ON CONFLICT (username) DO NOTHING;

INSERT INTO user_role_assignments (username, role_type) VALUES
  ('admin', 'admin'),
  ('vet_marie', 'vet'),
  ('vet_thomas', 'vet'),
  ('emp_luc', 'emp'),
  ('emp_sarah', 'emp'),
  ('emp_nina', 'emp'),
  ('emp_hugo', 'emp'),
  ('emp_lea', 'emp')
ON CONFLICT (username, role_type) DO NOTHING;

-- ---------------------------------------------------------
-- CONTACT INFO
-- ---------------------------------------------------------
INSERT INTO contact_info (type, value) VALUES
  ('Address', '123 Zoo Avenue, Arcadia'),
  ('Phone', '+33 1 23 45 67 89'),
  ('Email', 'contact@zoo-arcadia.fr'),
  ('Hours', 'Monday - Sunday: 9:00 AM - 6:00 PM'),
  ('Emergency', '+33 1 98 76 54 32'),
  ('Instagram', '@zoo_arcadia'),
  ('Facebook', 'Zoo Arcadia Official'),
  ('Parking', 'Free visitor parking available every day'),
  ('Accessibility', 'Wheelchair accessible paths and services')
ON CONFLICT (type) DO NOTHING;

-- ---------------------------------------------------------
-- HABITATS
-- ---------------------------------------------------------
INSERT INTO habitats (name, image_url) VALUES
  ('Savanna', 'https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=800&q=80'),
  ('Jungle', 'https://images.unsplash.com/photo-1440342359743-84fcb8c21f21?w=800&q=80'),
  ('Arctic', 'https://images.unsplash.com/photo-1462275646964-a0e3c11f18a6?w=800&q=80'),
  ('Desert', 'https://images.unsplash.com/photo-1509316785289-025f5b846b35?w=800&q=80'),
  ('Wetlands', 'https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=800&q=80'),
  ('Mountain', 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=800&q=80'),
  ('Tropical Aviary', 'https://images.unsplash.com/photo-1552728089-57bdde30beb3?w=800&q=80'),
  ('Reptile House', 'https://images.unsplash.com/photo-1504450874802-0ba2bcd659e0?w=800&q=80'),
  ('Aquatic Zone', 'https://images.unsplash.com/photo-1437622368342-7a3d73a34c8f?w=800&q=80'),
  ('Rainforest Dome', 'https://images.unsplash.com/photo-1448375240586-882707db888b?w=800&q=80')
ON CONFLICT (name) DO NOTHING;

-- ---------------------------------------------------------
-- SERVICES
-- ---------------------------------------------------------
INSERT INTO services (name, description, price, availability_schedule, image_url) VALUES
  ('Guided Safari Tour', 'Explore the savanna with our expert guides.', 25.00, 'Daily 10:00 - 16:00', 'https://images.unsplash.com/photo-1516426122078-c23e76319801?w=800&q=80'),
  ('Night Safari', 'Experience the zoo after dark with a guided group.', 35.00, 'Friday-Saturday 20:00 - 23:00', 'https://images.unsplash.com/photo-1470093851219-69951fcbb533?w=800&q=80'),
  ('Animal Encounter', 'Meet selected animals with a trained keeper.', 15.00, 'Daily 11:00 - 15:00', 'https://images.unsplash.com/photo-1474511320723-9a56873571b7?w=800&q=80'),
  ('Junior Zookeeper Workshop', 'Hands-on educational workshop for children.', 18.00, 'Wednesday-Sunday 14:00', 'https://images.unsplash.com/photo-1503454537195-1dcabb73ffb9?w=800&q=80'),
  ('Bird Feeding Experience', 'Participate in a supervised aviary feeding session.', 12.00, 'Daily 10:30 - 12:30', 'https://images.unsplash.com/photo-1444464666168-49d633b86797?w=800&q=80'),
  ('Reptile Discovery Tour', 'Guided visit through the reptile house.', 20.00, 'Tuesday-Sunday 13:00 - 16:00', 'https://images.unsplash.com/photo-1504450874802-0ba2bcd659e0?w=800&q=80'),
  ('VIP Behind the Scenes', 'Exclusive access to animal care and staff zones.', 60.00, 'Saturday 09:00 - 11:00', 'https://images.unsplash.com/photo-1503919545889-aef636e10ad4?w=800&q=80'),
  ('Family Explorer Pass', 'Bundled family activity package for 4 visitors.', 75.00, 'Daily', 'https://images.unsplash.com/photo-1511895426328-dc8714191300?w=800&q=80'),
  ('Photography Morning', 'Early-entry pass for wildlife photography lovers.', 40.00, 'Sunday 08:00 - 10:00', 'https://images.unsplash.com/photo-1549366021-9f761d450615?w=800&q=80'),
  ('School Education Visit', 'Educational group visit with guided sessions.', 10.00, 'Weekdays by reservation', 'https://images.unsplash.com/photo-1427504494785-3a9ca7044f45?w=800&q=80')
ON CONFLICT (name) DO NOTHING;

-- ---------------------------------------------------------
-- VISITORS
-- ---------------------------------------------------------
INSERT INTO visitors (username, name, lastname) VALUES
  ('alice.m', 'Alice', 'Martin'),
  ('kevin.d', 'Kevin', 'Dubois'),
  ('sophie.r', 'Sophie', 'Robert'),
  ('amina.k', 'Amina', 'Kamara'),
  ('lucas.b', 'Lucas', 'Boyer'),
  ('emma.t', 'Emma', 'Thomas'),
  ('nora.a', 'Nora', 'Aubry'),
  ('yanis.l', 'Yanis', 'Lemoine'),
  ('claire.p', 'Claire', 'Perrin'),
  ('adil.s', 'Adil', 'Said'),
  ('ines.v', 'Ines', 'Vidal'),
  ('paul.g', 'Paul', 'Garcia')
ON CONFLICT (username) DO NOTHING;

-- ---------------------------------------------------------
-- ANIMALS (20 across 10 habitats)
-- ---------------------------------------------------------
INSERT INTO animals (
  prenom, race, habitat_id, diet, description, characteristics, image_url,
  species, lifespan, size_weight, gestation, natural_habitat, native_region,
  lifestyle, distinctive_features
)
VALUES
  (
    'Simba', 'Lion',
    (SELECT id FROM habitats WHERE name = 'Savanna'),
    'Carnivore',
    'Dominant male lion living in the savanna enclosure.',
    'Strong, social, territorial',
    'https://images.unsplash.com/photo-1546182990-dffeafbe841d?w=800&q=80',
    'Panthera leo', '10-14 years', '190 kg / 1.2 m shoulder height', '110 days',
    'Grasslands and open savannas', 'Sub-Saharan Africa',
    'Pride-based social lifestyle',
    'Large mane and powerful roar'
  ),
  (
    'Nala', 'Lioness',
    (SELECT id FROM habitats WHERE name = 'Savanna'),
    'Carnivore',
    'Alert lioness known for agility and maternal behavior.',
    'Fast, observant, cooperative hunter',
    'https://images.unsplash.com/photo-1614027164847-1b28cfe1df60?w=800&q=80',
    'Panthera leo', '10-15 years', '130 kg / 1.1 m shoulder height', '110 days',
    'Savannas', 'Sub-Saharan Africa',
    'Social', 'Excellent hunting coordination'
  ),
  (
    'Kibo', 'Elephant',
    (SELECT id FROM habitats WHERE name = 'Savanna'),
    'Herbivore',
    'African elephant often seen near the watering area.',
    'Intelligent, calm, protective',
    'https://images.unsplash.com/photo-1557050543-4d5f4e07ef46?w=800&q=80',
    'Loxodonta africana', '60-70 years', '5000 kg / 3.3 m tall', '22 months',
    'Savannas and woodlands', 'Africa',
    'Herd-based', 'Long trunk and large ears'
  ),
  (
    'Zuri', 'Giraffe',
    (SELECT id FROM habitats WHERE name = 'Savanna'),
    'Herbivore',
    'Tall giraffe feeding mainly on high branches.',
    'Gentle, tall, attentive',
    'https://images.unsplash.com/photo-1547721064-da6cfb341d50?w=800&q=80',
    'Giraffa camelopardalis', '20-25 years', '800 kg / 5.2 m tall', '15 months',
    'Open woodlands and savannas', 'Africa',
    'Loose social groups', 'Long neck and patterned coat'
  ),
  (
    'Milo', 'Zebra',
    (SELECT id FROM habitats WHERE name = 'Savanna'),
    'Herbivore',
    'Young zebra that moves actively with the herd.',
    'Energetic, alert, social',
    'https://images.unsplash.com/photo-1526095179574-86e545346ae6?w=800&q=80',
    'Equus quagga', '20-25 years', '350 kg / 1.4 m tall', '12-13 months',
    'Savannas and grasslands', 'Eastern and Southern Africa',
    'Herd-based', 'Distinct black-and-white stripes'
  ),
  (
    'Rafiki', 'Mandrill',
    (SELECT id FROM habitats WHERE name = 'Jungle'),
    'Omnivore',
    'Colorful primate popular with visitors.',
    'Curious, vocal, dominant',
    'https://images.unsplash.com/photo-1540573133985-87b6da6d54a9?w=800&q=80',
    'Mandrillus sphinx', '20-30 years', '32 kg / 75 cm', '6 months',
    'Dense tropical forests', 'Central Africa',
    'Group-living', 'Bright blue and red facial markings'
  ),
  (
    'Luna', 'Jaguar',
    (SELECT id FROM habitats WHERE name = 'Jungle'),
    'Carnivore',
    'Stealthy big cat resting during daytime hours.',
    'Solitary, stealthy, powerful bite',
    'https://images.unsplash.com/photo-1551972873-b7e8754e8e26?w=800&q=80',
    'Panthera onca', '12-15 years', '95 kg / 1.8 m body length', '100 days',
    'Rainforests and wetlands', 'Central and South America',
    'Solitary', 'Rosette-patterned coat'
  ),
  (
    'Azul', 'Macaw',
    (SELECT id FROM habitats WHERE name = 'Tropical Aviary'),
    'Herbivore',
    'Blue-and-yellow macaw active in the aviary.',
    'Loud, intelligent, social',
    'https://images.unsplash.com/photo-1544923408-75c5cef46f14?w=800&q=80',
    'Ara ararauna', '30-50 years', '1.2 kg / 86 cm wingspan', '28 days incubation',
    'Tropical forests', 'South America',
    'Pair-bonded social bird', 'Bright blue-yellow plumage'
  ),
  (
    'Kaa', 'Python',
    (SELECT id FROM habitats WHERE name = 'Reptile House'),
    'Carnivore',
    'Large python kept in a climate-controlled terrarium.',
    'Calm, nocturnal, constrictor',
    'https://images.unsplash.com/photo-1531386151447-fd76ad50012f?w=800&q=80',
    'Python bivittatus', '20-25 years', '70 kg / 4.5 m', 'Egg-laying',
    'Wetlands and forests', 'Southeast Asia',
    'Solitary', 'Muscular body and camouflage pattern'
  ),
  (
    'Togo', 'Crocodile',
    (SELECT id FROM habitats WHERE name = 'Wetlands'),
    'Carnivore',
    'Large crocodile occupying the wetland basin.',
    'Ambush predator, patient, territorial',
    'https://images.unsplash.com/photo-1564349683136-77e08dba1ef7?w=800&q=80',
    'Crocodylus niloticus', '50-70 years', '500 kg / 4 m', 'Egg-laying',
    'Rivers and marshes', 'Africa',
    'Mostly solitary', 'Armored skin and powerful jaws'
  ),
  (
    'Nanuk', 'Polar Bear',
    (SELECT id FROM habitats WHERE name = 'Arctic'),
    'Carnivore',
    'Adult polar bear adapted to cold environments.',
    'Strong swimmer, powerful, curious',
    'https://images.unsplash.com/photo-1589656966895-2f33e7653571?w=800&q=80',
    'Ursus maritimus', '20-25 years', '450 kg / 2.5 m', '8 months including delayed implantation',
    'Sea ice and arctic coasts', 'Arctic Circle',
    'Mostly solitary', 'White fur and strong forelimbs'
  ),
  (
    'Freya', 'Arctic Fox',
    (SELECT id FROM habitats WHERE name = 'Arctic'),
    'Omnivore',
    'Small fox with seasonal coat changes.',
    'Agile, quiet, adaptable',
    'https://images.unsplash.com/photo-1516728778615-2d590ea1855e?w=800&q=80',
    'Vulpes lagopus', '10-14 years', '4 kg / 60 cm', '52 days',
    'Tundra', 'Arctic regions',
    'Pair and family group lifestyle', 'Dense fur and compact body'
  ),
  (
    'Sirocco', 'Camel',
    (SELECT id FROM habitats WHERE name = 'Desert'),
    'Herbivore',
    'Dromedary camel used in educational presentations.',
    'Resilient, calm, enduring',
    'https://images.unsplash.com/photo-1516476892398-bdcab4c8dab8?w=800&q=80',
    'Camelus dromedarius', '40-50 years', '600 kg / 2 m at hump', '13 months',
    'Deserts and arid plains', 'North Africa and Middle East',
    'Group-living', 'Single hump and water conservation adaptation'
  ),
  (
    'Pico', 'Meerkat',
    (SELECT id FROM habitats WHERE name = 'Desert'),
    'Omnivore',
    'Highly active meerkat seen on lookout duty.',
    'Alert, social, playful',
    'https://images.unsplash.com/photo-1577114995803-d8ce0e2b4aa9?w=800&q=80',
    'Suricata suricatta', '12-14 years', '1 kg / 35 cm', '11 weeks',
    'Dry open terrain', 'Southern Africa',
    'Large social colonies', 'Upright sentinel posture'
  ),
  (
    'Rocky', 'Snow Leopard',
    (SELECT id FROM habitats WHERE name = 'Mountain'),
    'Carnivore',
    'Mountain predator resting on elevated rocks.',
    'Elusive, agile, solitary',
    'https://images.unsplash.com/photo-1456926631375-92c8ce872def?w=800&q=80',
    'Panthera uncia', '15-18 years', '40 kg / 1.2 m body length', '90-100 days',
    'High mountain ranges', 'Central and South Asia',
    'Solitary', 'Thick tail and spotted coat'
  ),
  (
    'Mira', 'Red Panda',
    (SELECT id FROM habitats WHERE name = 'Mountain'),
    'Herbivore',
    'Tree-loving red panda active during cool hours.',
    'Shy, climbing specialist, calm',
    'https://images.unsplash.com/photo-1590691566903-692bf5ca7493?w=800&q=80',
    'Ailurus fulgens', '8-14 years', '5 kg / 60 cm', '135 days',
    'Temperate mountain forests', 'Himalayan region',
    'Mostly solitary', 'Reddish fur and ringed tail'
  ),
  (
    'Orion', 'Otter',
    (SELECT id FROM habitats WHERE name = 'Aquatic Zone'),
    'Carnivore',
    'Playful otter frequently seen swimming in groups.',
    'Playful, social, agile',
    'https://images.unsplash.com/photo-1580855083542-2dab5b3714a1?w=800&q=80',
    'Lutra lutra', '10-16 years', '9 kg / 1 m', '60-63 days',
    'Rivers, lakes and wetlands', 'Europe and Asia',
    'Small family groups', 'Streamlined body and dense fur'
  ),
  (
    'Bubbles', 'Penguin',
    (SELECT id FROM habitats WHERE name = 'Aquatic Zone'),
    'Carnivore',
    'Penguin thriving in the chilled aquatic enclosure.',
    'Social, vocal, fast swimmer',
    'https://images.unsplash.com/photo-1551986782-d0169b3f8fa7?w=800&q=80',
    'Spheniscus humboldti', '15-20 years', '4.5 kg / 65 cm', 'Egg-laying',
    'Coastal marine areas', 'South America',
    'Colony-based', 'Countershaded plumage'
  ),
  (
    'Tina', 'Toucan',
    (SELECT id FROM habitats WHERE name = 'Rainforest Dome'),
    'Omnivore',
    'Colorful toucan with a very active feeding pattern.',
    'Curious, lightweight, expressive',
    'https://images.unsplash.com/photo-1591608971362-f08b2a75731a?w=800&q=80',
    'Ramphastos toco', '15-20 years', '0.8 kg / 60 cm', 'Egg-laying',
    'Tropical forests', 'South America',
    'Small groups', 'Oversized colorful bill'
  ),
  (
    'Diego', 'Tapir',
    (SELECT id FROM habitats WHERE name = 'Rainforest Dome'),
    'Herbivore',
    'Tapir spending most of the day in shaded muddy areas.',
    'Docile, shy, nocturnal tendency',
    'https://images.unsplash.com/photo-1598894000396-bc30e0996899?w=800&q=80',
    'Tapirus terrestris', '25-30 years', '250 kg / 2 m', '13 months',
    'Rainforests and wetlands', 'South America',
    'Mostly solitary', 'Short flexible snout'
  )
ON CONFLICT (prenom, species) DO NOTHING;

-- ---------------------------------------------------------
-- REVIEWS
-- ---------------------------------------------------------
INSERT INTO reviews (visitor_name, review, rating, review_date, approved) VALUES
  ('Alice Martin', 'Beautiful zoo, very clean and the staff were helpful.', 5, NOW() - INTERVAL '18 days', TRUE),
  ('Kevin Dubois', 'The safari tour was excellent and very educational.', 5, NOW() - INTERVAL '16 days', TRUE),
  ('Sophie Robert', 'Great family experience, especially the giraffes and aviary.', 4, NOW() - INTERVAL '15 days', TRUE),
  ('Amina Kamara', 'Nice atmosphere, but the snack area was crowded.', 4, NOW() - INTERVAL '14 days', TRUE),
  ('Lucas Boyer', 'My kids loved the penguins and the keeper talk.', 5, NOW() - INTERVAL '12 days', TRUE),
  ('Emma Thomas', 'Good experience overall, signage could be clearer.', 4, NOW() - INTERVAL '11 days', TRUE),
  ('Nora Aubry', 'Very immersive habitats and well-maintained paths.', 5, NOW() - INTERVAL '10 days', TRUE),
  ('Yanis Lemoine', 'The reptile house was surprisingly one of the best parts.', 5, NOW() - INTERVAL '8 days', TRUE),
  ('Claire Perrin', 'Friendly staff and easy online booking process.', 4, NOW() - INTERVAL '7 days', TRUE),
  ('Adil Said', 'The night safari was unique and worth the extra cost.', 5, NOW() - INTERVAL '6 days', TRUE),
  ('Ines Vidal', 'Loved the educational angle, especially for children.', 5, NOW() - INTERVAL '5 days', TRUE),
  ('Paul Garcia', 'Great visit but parking filled up quickly around noon.', 4, NOW() - INTERVAL '3 days', FALSE);

-- ---------------------------------------------------------
-- BOOKINGS
-- ---------------------------------------------------------
INSERT INTO bookings (visitor_username, service_id, booking_date, status) VALUES
  ('alice.m', (SELECT id FROM services WHERE name = 'Guided Safari Tour'), CURRENT_DATE + 2, 'Confirmed'),
  ('kevin.d', (SELECT id FROM services WHERE name = 'Night Safari'), CURRENT_DATE + 4, 'Pending'),
  ('sophie.r', (SELECT id FROM services WHERE name = 'Animal Encounter'), CURRENT_DATE + 1, 'Confirmed'),
  ('amina.k', (SELECT id FROM services WHERE name = 'Junior Zookeeper Workshop'), CURRENT_DATE + 3, 'Confirmed'),
  ('lucas.b', (SELECT id FROM services WHERE name = 'Family Explorer Pass'), CURRENT_DATE + 5, 'Pending'),
  ('emma.t', (SELECT id FROM services WHERE name = 'Photography Morning'), CURRENT_DATE + 6, 'Confirmed'),
  ('nora.a', (SELECT id FROM services WHERE name = 'Bird Feeding Experience'), CURRENT_DATE + 2, 'Confirmed'),
  ('yanis.l', (SELECT id FROM services WHERE name = 'Reptile Discovery Tour'), CURRENT_DATE + 3, 'Pending'),
  ('claire.p', (SELECT id FROM services WHERE name = 'VIP Behind the Scenes'), CURRENT_DATE + 7, 'Confirmed'),
  ('adil.s', (SELECT id FROM services WHERE name = 'Guided Safari Tour'), CURRENT_DATE + 1, 'Confirmed'),
  ('ines.v', (SELECT id FROM services WHERE name = 'School Education Visit'), CURRENT_DATE + 9, 'Pending'),
  ('paul.g', (SELECT id FROM services WHERE name = 'Night Safari'), CURRENT_DATE + 10, 'Cancelled');

-- ---------------------------------------------------------
-- CONTACT SUBMISSIONS
-- ---------------------------------------------------------
INSERT INTO contact_submissions (name, email, phone, subject, message, created_at) VALUES
  ('Laura Benoit', 'laura.benoit@example.com', '+33 6 11 22 33 44', 'School visit inquiry', 'We would like to organize a school group visit for 28 students next month.', NOW() - INTERVAL '12 days'),
  ('Mathieu Caron', 'mathieu.caron@example.com', '+33 6 22 33 44 55', 'Lost item', 'My daughter may have left a blue backpack near the aviary.', NOW() - INTERVAL '9 days'),
  ('Sana El Idrissi', 'sana.elidrissi@example.com', '+33 6 33 44 55 66', 'Accessibility question', 'Can wheelchairs be rented on site?', NOW() - INTERVAL '8 days'),
  ('Romain Dufour', 'romain.dufour@example.com', '+33 6 44 55 66 77', 'Birthday event', 'Do you offer birthday packages for children?', NOW() - INTERVAL '7 days'),
  ('Helene Marchal', 'helene.marchal@example.com', NULL, 'Opening hours', 'Are you open on public holidays?', NOW() - INTERVAL '5 days'),
  ('Idriss Konate', 'idriss.konate@example.com', '+33 6 55 66 77 88', 'Partnership request', 'We are interested in a local tourism partnership.', NOW() - INTERVAL '3 days');

-- ---------------------------------------------------------
-- VETERINARY REPORTS
-- ---------------------------------------------------------
INSERT INTO veterinary_reports (
  animal_id, vet_username, report_date, health_status,
  treatment, weight_at_checkup, follow_up_date, habitat_comments
) VALUES
  ((SELECT id FROM animals WHERE prenom = 'Simba' AND species = 'Panthera leo'), 'vet_marie', CURRENT_DATE - 20, 'Stable', 'Routine examination completed. No treatment needed.', 191.50, CURRENT_DATE + 90, 'Habitat fencing and shaded area in good condition.'),
  ((SELECT id FROM animals WHERE prenom = 'Nala' AND species = 'Panthera leo'), 'vet_marie', CURRENT_DATE - 18, 'Stable', 'Mild paw irritation cleaned and monitored.', 132.20, CURRENT_DATE + 30, 'Ground substrate should remain dry near feeding zone.'),
  ((SELECT id FROM animals WHERE prenom = 'Kibo' AND species = 'Loxodonta africana'), 'vet_thomas', CURRENT_DATE - 16, 'Good', 'Foot pad inspection completed. Moisturizing care applied.', 5025.00, CURRENT_DATE + 45, 'Mud area and water access adequate.'),
  ((SELECT id FROM animals WHERE prenom = 'Zuri' AND species = 'Giraffa camelopardalis'), 'vet_thomas', CURRENT_DATE - 15, 'Stable', 'Routine checkup completed successfully.', 805.60, CURRENT_DATE + 60, 'Feeding platform height remains appropriate.'),
  ((SELECT id FROM animals WHERE prenom = 'Luna' AND species = 'Panthera onca'), 'vet_marie', CURRENT_DATE - 13, 'Under observation', 'Reduced appetite monitored. Enrichment adjusted.', 94.10, CURRENT_DATE + 14, 'Quiet zone should be maintained during peak visitor hours.'),
  ((SELECT id FROM animals WHERE prenom = 'Kaa' AND species = 'Python bivittatus'), 'vet_thomas', CURRENT_DATE - 11, 'Good', 'Humidity-related shedding check completed.', 71.30, CURRENT_DATE + 40, 'Humidity and heat levels should be closely monitored.'),
  ((SELECT id FROM animals WHERE prenom = 'Nanuk' AND species = 'Ursus maritimus'), 'vet_marie', CURRENT_DATE - 10, 'Stable', 'Routine dental inspection completed.', 448.00, CURRENT_DATE + 75, 'Pool cooling system functioning correctly.'),
  ((SELECT id FROM animals WHERE prenom = 'Rocky' AND species = 'Panthera uncia'), 'vet_thomas', CURRENT_DATE - 8, 'Good', 'Minor muscle stiffness after activity. Anti-inflammatory course prescribed.', 41.20, CURRENT_DATE + 21, 'Rock climbing structures remain safe and dry.'),
  ((SELECT id FROM animals WHERE prenom = 'Orion' AND species = 'Lutra lutra'), 'vet_marie', CURRENT_DATE - 6, 'Stable', 'Routine exam completed. Excellent coat condition.', 9.40, CURRENT_DATE + 60, 'Water filtration quality is good.'),
  ((SELECT id FROM animals WHERE prenom = 'Diego' AND species = 'Tapirus terrestris'), 'vet_thomas', CURRENT_DATE - 4, 'Good', 'Skin inspection completed. No abnormal findings.', 248.70, CURRENT_DATE + 90, 'Mud bath area should remain available daily.');

-- ---------------------------------------------------------
-- FEEDING RECORDS
-- ---------------------------------------------------------
INSERT INTO feeding_records (animal_id, meal_preparation, weight, feeding_time) VALUES
  ((SELECT id FROM animals WHERE prenom = 'Simba' AND species = 'Panthera leo'), '4 kg beef with supplements', 4.00, NOW() - INTERVAL '10 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Nala' AND species = 'Panthera leo'), '3.5 kg poultry and vitamins', 3.50, NOW() - INTERVAL '9 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Kibo' AND species = 'Loxodonta africana'), 'Hay, apples, carrots, leafy greens', 65.00, NOW() - INTERVAL '8 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Zuri' AND species = 'Giraffa camelopardalis'), 'Acacia branches and pellet mix', 18.00, NOW() - INTERVAL '7 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Milo' AND species = 'Equus quagga'), 'Grass hay and mineral supplement', 12.00, NOW() - INTERVAL '7 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Rafiki' AND species = 'Mandrillus sphinx'), 'Fruit bowl, seeds, insects', 3.20, NOW() - INTERVAL '6 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Luna' AND species = 'Panthera onca'), '3 kg rabbit meat', 3.00, NOW() - INTERVAL '6 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Azul' AND species = 'Ara ararauna'), 'Tropical fruit mix and nuts', 0.45, NOW() - INTERVAL '5 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Kaa' AND species = 'Python bivittatus'), 'Whole prey feeding', 2.80, NOW() - INTERVAL '4 days'),
  ((SELECT id FROM animals WHERE prenom = 'Togo' AND species = 'Crocodylus niloticus'), 'Fish and poultry portions', 6.50, NOW() - INTERVAL '12 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Nanuk' AND species = 'Ursus maritimus'), 'Fish, seal-fat substitute, enrichment ice blocks', 14.00, NOW() - INTERVAL '11 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Freya' AND species = 'Vulpes lagopus'), 'Mixed protein and berries', 0.90, NOW() - INTERVAL '10 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Sirocco' AND species = 'Camelus dromedarius'), 'Dry forage and vegetables', 20.00, NOW() - INTERVAL '9 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Pico' AND species = 'Suricata suricatta'), 'Insects, eggs and chopped vegetables', 0.35, NOW() - INTERVAL '8 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Rocky' AND species = 'Panthera uncia'), '2.5 kg meat ration', 2.50, NOW() - INTERVAL '7 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Mira' AND species = 'Ailurus fulgens'), 'Bamboo, fruit and biscuits', 1.10, NOW() - INTERVAL '6 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Orion' AND species = 'Lutra lutra'), 'Fish and shellfish mix', 1.80, NOW() - INTERVAL '5 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Bubbles' AND species = 'Spheniscus humboldti'), 'Sardines and capelin', 1.20, NOW() - INTERVAL '5 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Tina' AND species = 'Ramphastos toco'), 'Fruit slices and insects', 0.40, NOW() - INTERVAL '4 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Diego' AND species = 'Tapirus terrestris'), 'Leafy greens, fruit and root vegetables', 11.00, NOW() - INTERVAL '4 hours');

-- ---------------------------------------------------------
-- ANIMAL CLICKS (analytics)
-- ---------------------------------------------------------
INSERT INTO animal_clicks (animal_id, click_count, animal_name, first_click, last_click) VALUES
  ((SELECT id FROM animals WHERE prenom = 'Simba' AND species = 'Panthera leo'), 128, 'Simba', NOW() - INTERVAL '60 days', NOW() - INTERVAL '2 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Nala' AND species = 'Panthera leo'), 93, 'Nala', NOW() - INTERVAL '58 days', NOW() - INTERVAL '5 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Kibo' AND species = 'Loxodonta africana'), 115, 'Kibo', NOW() - INTERVAL '57 days', NOW() - INTERVAL '1 day'),
  ((SELECT id FROM animals WHERE prenom = 'Zuri' AND species = 'Giraffa camelopardalis'), 110, 'Zuri', NOW() - INTERVAL '55 days', NOW() - INTERVAL '9 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Luna' AND species = 'Panthera onca'), 87, 'Luna', NOW() - INTERVAL '54 days', NOW() - INTERVAL '6 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Azul' AND species = 'Ara ararauna'), 76, 'Azul', NOW() - INTERVAL '52 days', NOW() - INTERVAL '7 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Nanuk' AND species = 'Ursus maritimus'), 132, 'Nanuk', NOW() - INTERVAL '50 days', NOW() - INTERVAL '3 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Rocky' AND species = 'Panthera uncia'), 84, 'Rocky', NOW() - INTERVAL '48 days', NOW() - INTERVAL '11 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Orion' AND species = 'Lutra lutra'), 69, 'Orion', NOW() - INTERVAL '47 days', NOW() - INTERVAL '13 hours'),
  ((SELECT id FROM animals WHERE prenom = 'Bubbles' AND species = 'Spheniscus humboldti'), 97, 'Bubbles', NOW() - INTERVAL '45 days', NOW() - INTERVAL '8 hours')
ON CONFLICT (animal_id) DO UPDATE SET
  click_count = EXCLUDED.click_count,
  animal_name = EXCLUDED.animal_name,
  last_click = EXCLUDED.last_click;
