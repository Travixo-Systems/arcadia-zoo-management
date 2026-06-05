-- =========================================================
-- FIX ANIMAL IMAGE URLs  (run in Supabase SQL Editor)
-- =========================================================
-- WHY THIS EXISTS
--   The seed dataset's animal image_url values were broken in
--   three ways:
--     1. 16 used Unsplash *page slugs* (photo-JB9-tC0LleQ) instead
--        of CDN *file IDs* -> 404, broken image.
--     2. ~11 used Unsplash CDN IDs that no longer resolve -> 404.
--     3. ~19 loaded fine but showed the WRONG animal
--        (e.g. lion card -> zebras, meerkat -> giraffe,
--         red panda -> orangutan, sea turtle -> a puppy).
--
--   Every image below was replaced with a canonical species photo
--   from Wikimedia Commons and VISUALLY VERIFIED in a browser to
--   show the correct animal. Wikimedia file URLs are permanent and
--   do not 404.
--
--   Match key: (prenom, species) — the unique animal pair.
-- =========================================================

BEGIN;

-- ── SAVANNA ──────────────────────────────────────────────
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/020_The_lion_king_Snyggve_in_the_Serengeti_National_Park_Photo_by_Giles_Laurent.jpg/3840px-020_The_lion_king_Snyggve_in_the_Serengeti_National_Park_Photo_by_Giles_Laurent.jpg'
  WHERE prenom = 'Kofi' AND species = 'Panthera leo';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Giraffe_Mikumi_National_Park.jpg'
  WHERE prenom = 'Twiga' AND species = 'Giraffa camelopardalis';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/178_Male_African_bush_elephant_in_Etosha_National_Park_Photo_by_Giles_Laurent.jpg/3840px-178_Male_African_bush_elephant_in_Etosha_National_Park_Photo_by_Giles_Laurent.jpg'
  WHERE prenom = 'Nia' AND species = 'Loxodonta africana';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/c/c7/Southern_Ground_Hornbill_%28Bucorvus_leadbeateri%29_male_%2812714625605%29%2C_crop.jpg'
  WHERE prenom = 'Zazu' AND species = 'Bucorvus leadbeateri';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Southern_warthog_%28Phacochoerus_africanus_sundevallii%29_male.jpg/3840px-Southern_warthog_%28Phacochoerus_africanus_sundevallii%29_male.jpg'
  WHERE prenom = 'Tusker' AND species = 'Phacochoerus africanus';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Male_cheetah_facing_left_in_South_Africa.jpg/3840px-Male_cheetah_facing_left_in_South_Africa.jpg'
  WHERE prenom = 'Duma' AND species = 'Acinonyx jubatus';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/109_Male_White_rhinoceros_walking_in_the_Kalahari_Desert_of_Namibia_Photo_by_Giles_Laurent.jpg/3840px-109_Male_White_rhinoceros_walking_in_the_Kalahari_Desert_of_Namibia_Photo_by_Giles_Laurent.jpg'
  WHERE prenom = 'Kesi' AND species = 'Ceratotherium simum';

-- ── JUNGLE ───────────────────────────────────────────────
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/0/0a/Standing_jaguar.jpg'
  WHERE prenom = 'Shadow' AND species = 'Panthera onca';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/7/70/Alouatta_seniculus_Sorocaba.JPG'
  WHERE prenom = 'Howl' AND species = 'Alouatta seniculus';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/d/d6/Tanjung_Puting30477.jpg'
  WHERE prenom = 'Bumi' AND species = 'Pongo pygmaeus';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Scarlet_macaw_%28Ara_macao_cyanopterus%29_Copan.jpg/3840px-Scarlet_macaw_%28Ara_macao_cyanopterus%29_Copan.jpg'
  WHERE prenom = 'Tico' AND species = 'Ara macao';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/5/50/Male_gorilla_in_SF_zoo.jpg'
  WHERE prenom = 'Kondo' AND species = 'Gorilla gorilla';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/006_Toco_toucan_in_Encontro_das_%C3%81guas_State_Park_Photo_by_Giles_Laurent.jpg/3840px-006_Toco_toucan_in_Encontro_das_%C3%81guas_State_Park_Photo_by_Giles_Laurent.jpg'
  WHERE prenom = 'Toco' AND species = 'Ramphastos toco';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/South_American_tapir_%28Tapirus_terrestris%29.JPG/3840px-South_American_tapir_%28Tapirus_terrestris%29.JPG'
  WHERE prenom = 'Baro' AND species = 'Tapirus terrestris';

-- ── WETLANDS ─────────────────────────────────────────────
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/0/03/American_Alligator.jpg'
  WHERE prenom = 'Gator' AND species = 'Alligator mississippiensis';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/a/aa/North-American-bullfrog1.jpg'
  WHERE prenom = 'Jumper' AND species = 'Lithobates catesbeianus';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/c/c3/2021-05-05_Phalacrocorax_carbo_carbo%2C_Killingworth_Lake%2C_Northumberland_1-1.jpg'
  WHERE prenom = 'Nessie' AND species = 'Phalacrocorax carbo';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Grey_heron_2022_03_18_01.jpg/3840px-Grey_heron_2022_03_18_01.jpg'
  WHERE prenom = 'Herbie' AND species = 'Ardea cinerea';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/9/99/Manatee_with_calf.PD_-_colour_corrected.jpg'
  WHERE prenom = 'Swampy' AND species = 'Trichechus manatus';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/010_Greater_flamingos_male_and_female_in_the_Camargue_during_mating_season_Photo_by_Giles_Laurent.jpg/3840px-010_Greater_flamingos_male_and_female_in_the_Camargue_during_mating_season_Photo_by_Giles_Laurent.jpg'
  WHERE prenom = 'Rosa' AND species = 'Phoenicopterus roseus';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/d/d3/Fischotter%2C_Lutra_Lutra.JPG'
  WHERE prenom = 'Swift' AND species = 'Lutra lutra';

-- ── TUNDRA ───────────────────────────────────────────────
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/6/66/Polar_Bear_-_Alaska_%28cropped%29.jpg'
  WHERE prenom = 'Nanook' AND species = 'Ursus maritimus';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/d/dc/Vulpes_lagopus_in_Iceland_%28cropped_3%29.jpg'
  WHERE prenom = 'Blizzard' AND species = 'Vulpes lagopus';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/9/96/Reinbukken_p%C3%A5_frisk_gr%C3%B8nt_beite._-_panoramio.jpg'
  WHERE prenom = 'Tundra' AND species = 'Rangifer tarandus';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/f/f1/SnowyOwlAmericanBlackDuck.jpg'
  WHERE prenom = 'Snowy' AND species = 'Bubo scandiacus';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Spheniscus_humboldti_%2854905367722%29.jpg/3840px-Spheniscus_humboldti_%2854905367722%29.jpg'
  WHERE prenom = 'Frost' AND species = 'Spheniscus humboldti';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/2/22/Harp_Seal_%28Pagophilus_groenlandicus%29%2C_Greenland_Sea_IMG_5075.jpg'
  WHERE prenom = 'Siku' AND species = 'Pagophilus groenlandicus';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/c/ca/Muskox_%28Ovibos_moschatus%29_male_Dovrefjell_4.jpg'
  WHERE prenom = 'Boreal' AND species = 'Ovibos moschatus';

-- ── DESERT ───────────────────────────────────────────────
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Camelus_dromedarius_in_Nuweiba.jpg/3840px-Camelus_dromedarius_in_Nuweiba.jpg'
  WHERE prenom = 'Sable' AND species = 'Camelus dromedarius';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/9/9a/Meerkat_%28Suricata_suricatta%29_Tswalu.jpg'
  WHERE prenom = 'Mira' AND species = 'Suricata suricatta';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/9/9f/Fennec_Fox_Vulpes_zerda.jpg'
  WHERE prenom = 'Fennel' AND species = 'Vulpes zerda';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/f/f4/Gopherus_agassizii.jpg'
  WHERE prenom = 'Pebble' AND species = 'Gopherus agassizii';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/b/b4/Sucuri_verde.jpg'
  WHERE prenom = 'Coil' AND species = 'Eunectes murinus';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/7/70/Crotalus_cerastes_mesquite_springs_CA-2.jpg'
  WHERE prenom = 'Dune' AND species = 'Crotalus cerastes';

-- ── MOUNTAIN ─────────────────────────────────────────────
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/a/a5/Irbis4.JPG'
  WHERE prenom = 'Ghost' AND species = 'Panthera uncia';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/f/fd/Red_Panda%2C_Gentle_Tree-Dweller_of_the_Himalayas.jpg'
  WHERE prenom = 'Ruki' AND species = 'Ailurus fulgens';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/2/23/Mountain_Goat%2C_Enchantments_Basin.jpg'
  WHERE prenom = 'Crag' AND species = 'Oreamnos americanus';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/c/cc/015_Wild_Golden_Eagle_in_flight_at_Pfyn-Finges_%28Switzerland%29_Photo_by_Giles_Laurent.jpg'
  WHERE prenom = 'Talon' AND species = 'Aquila chrysaetos';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/7/76/Sarlyk_Yak2.jpg'
  WHERE prenom = 'Yuki' AND species = 'Bos grunniens';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/9/9b/003_Wild_Alpine_Ibex_Sunset_Creux_du_Van_Mont_Racine_Photo_by_Giles_Laurent.jpg'
  WHERE prenom = 'Atlas' AND species = 'Capra ibex';

-- ── TROPICAL AVIARY ──────────────────────────────────────
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/a/a9/Cacatua_galerita_Tas_2.jpg'
  WHERE prenom = 'Pearl' AND species = 'Cacatua galerita';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/a/ad/Rainbow_lorikeet_%28Trichoglossus_moluccanus_moluccanus%29_Sydney.jpg'
  WHERE prenom = 'Lori' AND species = 'Trichoglossus moluccanus';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/b/b7/155_Southern_yellow-billed_hornbill_in_Etosha_National_Park_Photo_by_Giles_Laurent.jpg'
  WHERE prenom = 'Beak' AND species = 'Tockus leucomelas';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/3/3c/Perroquet_%C3%A0_Yampopo_Beach_-_Douala.jpg'
  WHERE prenom = 'Echo' AND species = 'Psittacus erithacus';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/e/ec/Ara_ararauna_Luc_Viatour.jpg'
  WHERE prenom = 'Azul' AND species = 'Ara ararauna';

-- ── AQUATIC ZONE ─────────────────────────────────────────
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/3/3f/California_Sea_Lion%2C_Monterey%2C_California%2C_United_States_imported_from_iNaturalist_photo_203598492.jpg'
  WHERE prenom = 'Leo' AND species = 'Zalophus californianus';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/f/f6/Clown_fish_in_the_Andaman_Coral_Reef.jpg'
  WHERE prenom = 'Coral' AND species = 'Amphiprion ocellaris';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Green_sea_turtle_%28Chelonia_mydas%29_Moorea.jpg'
  WHERE prenom = 'Marina' AND species = 'Chelonia mydas';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/f/f9/Aurelia_aurita_%28Cnidaria%29_Luc_Viatour.jpg'
  WHERE prenom = 'Drift' AND species = 'Aurelia aurita';
UPDATE animals SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/2/25/Hippocampus_hippocampus_%28on_Ascophyllum_nodosum%29.jpg'
  WHERE prenom = 'Pip' AND species = 'Hippocampus hippocampus';

-- ── HABITAT BANNER FIX (Tundra banner was a dead Unsplash ID) ──
UPDATE habitats SET image_url = 'https://upload.wikimedia.org/wikipedia/commons/1/17/Greenland_scoresby-sydkapp2_hg.jpg'
  WHERE name = 'Tundra';

COMMIT;

-- Sanity check: list any animal whose image is still a broken/legacy URL.
-- Expect 0 rows after running the updates above.
SELECT prenom, species, image_url
FROM animals
WHERE image_url IS NULL
   OR image_url NOT LIKE 'https://upload.wikimedia.org/%';
