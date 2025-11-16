/*
  # Seed Initial GameSoul Data
  
  ## Purpose
  Populate the database with initial vibes and sample indie games to get started.
  
  ## Changes
  1. Insert predefined vibe categories with colors and descriptions
  2. Insert curated sample indie games with rich metadata
  
  ## Data
  - 12 unique vibes covering different moods
  - 15+ sample indie games across various genres and vibes
*/

-- Insert vibes
INSERT INTO vibes (name, description, color, emoji) VALUES
  ('Cozy', 'Warm, comfortable, and relaxing experiences', '#F59E0B', '☕'),
  ('Melancholic', 'Bittersweet, contemplative, and emotionally deep', '#6366F1', '🌙'),
  ('Adventurous', 'Exploration, discovery, and excitement', '#10B981', '🗺️'),
  ('Mysterious', 'Enigmatic, intriguing, and atmospheric', '#8B5CF6', '🔮'),
  ('Nostalgic', 'Reminiscent, retro, and memory-evoking', '#EC4899', '📼'),
  ('Peaceful', 'Serene, tranquil, and meditative', '#06B6D4', '🕊️'),
  ('Whimsical', 'Playful, quirky, and imaginative', '#F97316', '✨'),
  ('Dark', 'Haunting, eerie, and intense', '#1F2937', '🌑'),
  ('Uplifting', 'Inspiring, joyful, and heartwarming', '#FBBF24', '🌟'),
  ('Surreal', 'Dreamlike, abstract, and mind-bending', '#A78BFA', '🌀'),
  ('Challenging', 'Difficult, demanding, and skill-testing', '#EF4444', '⚡'),
  ('Meditative', 'Zen-like, calming, and introspective', '#34D399', '🧘')
ON CONFLICT (name) DO NOTHING;

-- Insert sample indie games
INSERT INTO games (title, description, developer, cover_image, release_year, vibe_tags, gameplay_style, estimated_hours) VALUES
  (
    'Celeste',
    'Help Madeline survive her inner demons on her journey to the top of Celeste Mountain in this super-tight platformer.',
    'Maddy Makes Games',
    'https://images.pexels.com/photos/1619317/pexels-photo-1619317.jpeg?auto=compress&cs=tinysrgb&w=800',
    2018,
    ARRAY['Challenging', 'Uplifting', 'Nostalgic'],
    'Precision Platformer',
    '8-12 hours'
  ),
  (
    'Stardew Valley',
    'Move to the countryside and cultivate a new life in this award-winning farming simulation. Grow crops, raise animals, and build relationships.',
    'ConcernedApe',
    'https://images.pexels.com/photos/2132171/pexels-photo-2132171.jpeg?auto=compress&cs=tinysrgb&w=800',
    2016,
    ARRAY['Cozy', 'Peaceful', 'Nostalgic'],
    'Farming Simulation',
    '50+ hours'
  ),
  (
    'Gris',
    'A serene and evocative experience, free of danger, frustration or death. Explore a world brought to life with delicate art and detailed animation.',
    'Nomada Studio',
    'https://images.pexels.com/photos/1323550/pexels-photo-1323550.jpeg?auto=compress&cs=tinysrgb&w=800',
    2018,
    ARRAY['Peaceful', 'Melancholic', 'Uplifting'],
    'Atmospheric Platformer',
    '3-4 hours'
  ),
  (
    'Hollow Knight',
    'Forge your own path in a vast interconnected world. Battle tainted creatures and befriend bizarre bugs in this challenging 2D action-adventure.',
    'Team Cherry',
    'https://images.pexels.com/photos/2156881/pexels-photo-2156881.jpeg?auto=compress&cs=tinysrgb&w=800',
    2017,
    ARRAY['Dark', 'Mysterious', 'Challenging'],
    'Metroidvania',
    '25-35 hours'
  ),
  (
    'A Short Hike',
    'Explore, climb, and soar through the peaceful mountainside landscapes of Hawk Peak Provincial Park.',
    'adamgryu',
    'https://images.pexels.com/photos/1612351/pexels-photo-1612351.jpeg?auto=compress&cs=tinysrgb&w=800',
    2019,
    ARRAY['Cozy', 'Peaceful', 'Adventurous'],
    'Exploration Adventure',
    '1-2 hours'
  ),
  (
    'Undertale',
    'A small child falls into the Underground, where monsters have long been banished by humans. Will you show them mercy or hunt them down?',
    'Toby Fox',
    'https://images.pexels.com/photos/1337247/pexels-photo-1337247.jpeg?auto=compress&cs=tinysrgb&w=800',
    2015,
    ARRAY['Whimsical', 'Uplifting', 'Nostalgic'],
    'RPG',
    '6-8 hours'
  ),
  (
    'Outer Wilds',
    'An award-winning open world mystery about a solar system trapped in an endless time loop.',
    'Mobius Digital',
    'https://images.pexels.com/photos/956999/milky-way-starry-sky-night-sky-star-956999.jpeg?auto=compress&cs=tinysrgb&w=800',
    2019,
    ARRAY['Mysterious', 'Adventurous', 'Surreal'],
    'Exploration Puzzle',
    '15-20 hours'
  ),
  (
    'Spiritfarer',
    'Build a boat to explore the world, care for spirits, and release them into the afterlife in this cozy management game about dying.',
    'Thunder Lotus Games',
    'https://images.pexels.com/photos/1166644/pexels-photo-1166644.jpeg?auto=compress&cs=tinysrgb&w=800',
    2020,
    ARRAY['Cozy', 'Melancholic', 'Uplifting'],
    'Management Adventure',
    '20-25 hours'
  ),
  (
    'Kentucky Route Zero',
    'A magical realist adventure game about a secret highway running through the caves beneath Kentucky.',
    'Cardboard Computer',
    'https://images.pexels.com/photos/1933316/pexels-photo-1933316.jpeg?auto=compress&cs=tinysrgb&w=800',
    2020,
    ARRAY['Surreal', 'Mysterious', 'Melancholic'],
    'Point-and-Click Adventure',
    '8-10 hours'
  ),
  (
    'Hades',
    'Defy the god of the dead as you hack and slash out of the Underworld in this rogue-like dungeon crawler.',
    'Supergiant Games',
    'https://images.pexels.com/photos/2693529/pexels-photo-2693529.jpeg?auto=compress&cs=tinysrgb&w=800',
    2020,
    ARRAY['Challenging', 'Dark', 'Uplifting'],
    'Rogue-like Action',
    '30-40 hours'
  ),
  (
    'Journey',
    'Explore ancient ruins in a vast desert, discovering secrets and encountering other travelers in this wordless adventure.',
    'thatgamecompany',
    'https://images.pexels.com/photos/2387873/pexels-photo-2387873.jpeg?auto=compress&cs=tinysrgb&w=800',
    2012,
    ARRAY['Peaceful', 'Mysterious', 'Meditative'],
    'Adventure',
    '2-3 hours'
  ),
  (
    'Disco Elysium',
    'A groundbreaking open world role playing game. Become a hero or an absolute disaster of a human being.',
    'ZA/UM',
    'https://images.pexels.com/photos/1146505/pexels-photo-1146505.jpeg?auto=compress&cs=tinysrgb&w=800',
    2019,
    ARRAY['Dark', 'Surreal', 'Melancholic'],
    'RPG Detective',
    '20-30 hours'
  ),
  (
    'Sable',
    'Embark on a unique and unforgettable journey and guide Sable through her Gliding on a desert planet.',
    'Shedworks',
    'https://images.pexels.com/photos/2387793/pexels-photo-2387793.jpeg?auto=compress&cs=tinysrgb&w=800',
    2021,
    ARRAY['Peaceful', 'Adventurous', 'Meditative'],
    'Open World Exploration',
    '8-12 hours'
  ),
  (
    'Night in the Woods',
    'A story-focused adventure about a cat who dropped out of college and returned to her dying hometown.',
    'Infinite Fall',
    'https://images.pexels.com/photos/1624438/pexels-photo-1624438.jpeg?auto=compress&cs=tinysrgb&w=800',
    2017,
    ARRAY['Melancholic', 'Whimsical', 'Mysterious'],
    'Story Adventure',
    '8-10 hours'
  ),
  (
    'Firewatch',
    'A first-person mystery set in the Wyoming wilderness, where your only emotional lifeline is the person on the other end of a handheld radio.',
    'Campo Santo',
    'https://images.pexels.com/photos/1561020/pexels-photo-1561020.jpeg?auto=compress&cs=tinysrgb&w=800',
    2016,
    ARRAY['Mysterious', 'Melancholic', 'Adventurous'],
    'First-Person Adventure',
    '4-5 hours'
  )
ON CONFLICT DO NOTHING;