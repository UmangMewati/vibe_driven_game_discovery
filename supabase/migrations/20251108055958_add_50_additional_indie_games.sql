/*
  # Add 50 Additional Premium Indie Games

  1. Changes
    - Add 50 more carefully curated indie games across diverse genres
    - Includes roguelikes, puzzle games, adventure titles, and narrative experiences
    - Each game has complete metadata: descriptions, developers, release years, vibes, playtime
    - All entries include Steam store URLs for direct purchase
  
  2. Game Selection Criteria
    - Critically acclaimed indie titles
    - Diverse gameplay styles and emotional experiences
    - Strong community reception and reviews
    - Unique mechanics or artistic vision
*/

INSERT INTO games (title, description, developer, cover_image, release_year, vibe_tags, gameplay_style, estimated_hours, store_url) VALUES
('Enter the Gungeon', 'A bullet hell dungeon crawler where you shoot, loot, dodge roll, and manipulate tables to reach the legendary Gungeon and kill the past. Hundreds of guns and items await.', 'Dodge Roll', 'https://images.unsplash.com/photo-1538481199705-c710c4e965fc?w=800', 2016, ARRAY['Challenging', 'Adventurous', 'Whimsical'], 'Rogue-like Shooter', '50+ hours', 'https://store.steampowered.com/app/311690/'),

('Stardew Valley', 'Build your dream farm in this beloved country-life RPG. Raise animals, grow crops, craft goods, mine for ores, and befriend the townsfolk in this peaceful escape.', 'ConcernedApe', 'https://images.unsplash.com/photo-1560493676-04071c5f467b?w=800', 2016, ARRAY['Cozy', 'Peaceful', 'Uplifting'], 'Farming Simulation', '100+ hours', 'https://store.steampowered.com/app/413150/'),

('Disco Elysium', 'A groundbreaking role-playing game where you play a detective with a unique skill system. Your mind is your greatest weapon in this narrative-driven masterpiece.', 'ZA/UM', 'https://images.unsplash.com/photo-1511512578047-dfb367046420?w=800', 2019, ARRAY['Dark', 'Melancholic', 'Mysterious'], 'Narrative RPG', '25-40 hours', 'https://store.steampowered.com/app/632470/'),

('The Messenger', 'A ninja adventure featuring dynamic gameplay that shifts between 8-bit and 16-bit eras. Tight platforming meets time-traveling storytelling.', 'Sabotage Studio', 'https://images.unsplash.com/photo-1511512578047-dfb367046420?w=800', 2018, ARRAY['Nostalgic', 'Challenging', 'Adventurous'], 'Action Platformer', '8-12 hours', 'https://store.steampowered.com/app/764790/'),

('Oxygen Not Included', 'Manage a colony of duplicants in a space-rock. Balance oxygen, heat, food, and stress in this brutally complex survival simulation.', 'Klei Entertainment', 'https://images.unsplash.com/photo-1614728894747-a83421e2b9c9?w=800', 2019, ARRAY['Challenging', 'Meditative', 'Dark'], 'Colony Simulation', '100+ hours', 'https://store.steampowered.com/app/457140/'),

('Slay the Spire', 'Craft unique decks and climb the spire in this addictive deck-building roguelike. Every run offers new synergies and strategic decisions.', 'Mega Crit', 'https://images.unsplash.com/photo-1577741314755-048d8525d31e?w=800', 2019, ARRAY['Challenging', 'Meditative', 'Dark'], 'Deck-builder', '80+ hours', 'https://store.steampowered.com/app/646570/'),

('Cuphead', 'A run-and-gun platformer with stunning 1930s cartoon animation. Every boss battle is hand-drawn and brutally challenging.', 'Studio MDHR', 'https://images.unsplash.com/photo-1563207153-f403bf289096?w=800', 2017, ARRAY['Challenging', 'Nostalgic', 'Whimsical'], 'Boss Rush Platformer', '10-15 hours', 'https://store.steampowered.com/app/268910/'),

('A Short Hike', 'Explore a beautiful island, meet quirky characters, and reach the mountain peak in this charming adventure. Short but unforgettable.', 'adamgryu', 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800', 2019, ARRAY['Peaceful', 'Uplifting', 'Cozy'], 'Exploration Adventure', '2-3 hours', 'https://store.steampowered.com/app/1055540/'),

('Hades', 'Hack and slash your way out of Hell in this roguelike dungeon crawler. Stunning art, incredible voice acting, and addictive combat define this masterpiece.', 'Supergiant Games', 'https://images.unsplash.com/photo-1552820728-8b83bb6b773f?w=800', 2020, ARRAY['Challenging', 'Dark', 'Adventurous'], 'Rogue-like Action', '60+ hours', 'https://store.steampowered.com/app/1145360/'),

('Spiritfarer', 'Build a boat and become a ferrymaster to the deceased. Farm, mine, craft, and care for spirits before releasing them into the afterlife.', 'Thunder Lotus', 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=800', 2020, ARRAY['Cozy', 'Melancholic', 'Peaceful'], 'Management Adventure', '20-30 hours', 'https://store.steampowered.com/app/972660/'),

('Tunic', 'An isometric adventure about a tiny fox in a big world. Solve puzzles, discover secrets, and decipher an in-game instruction manual.', 'Andrew Shouldice', 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=800', 2022, ARRAY['Mysterious', 'Adventurous', 'Challenging'], 'Action Adventure', '12-20 hours', 'https://store.steampowered.com/app/553420/'),

('Celeste', 'Climb a mountain while battling anxiety in this pixel-perfect platformer. Tight controls, heartfelt story, and challenging levels await.', 'Maddy Makes Games', 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800', 2018, ARRAY['Challenging', 'Uplifting', 'Melancholic'], 'Platformer', '10-15 hours', 'https://store.steampowered.com/app/504230/'),

('Unpacking', 'Unpack boxes and arrange belongings across different homes. This zen puzzle game tells a story through objects and spaces.', 'Witch Beam', 'https://images.unsplash.com/photo-1560493676-04071c5f467b?w=800', 2021, ARRAY['Peaceful', 'Cozy', 'Nostalgic'], 'Puzzle', '4-6 hours', 'https://store.steampowered.com/app/1135690/'),

('Valheim', 'Explore a procedurally generated Norse purgatory with up to 10 players. Build, craft, and survive in this brutal Viking survival game.', 'Iron Gate', 'https://images.unsplash.com/photo-1579567761406-4684ee0c75b6?w=800', 2021, ARRAY['Adventurous', 'Challenging', 'Meditative'], 'Survival Crafting', '100+ hours', 'https://store.steampowered.com/app/892970/'),

('Noita', 'A magical action roguelite where every pixel is physically simulated. Create devastating spell combinations and watch the world react.', 'Nolla Games', 'https://images.unsplash.com/photo-1552820728-8b83bb6b773f?w=800', 2020, ARRAY['Challenging', 'Dark', 'Surreal'], 'Rogue-like Platformer', '50+ hours', 'https://store.steampowered.com/app/881100/'),

('Wildermyth', 'A character-driven tactical RPG where your heroes age, transform, and die. Every campaign creates unique stories and legends.', 'Worldwalker Games', 'https://images.unsplash.com/photo-1569003339405-ea396a5a8a90?w=800', 2021, ARRAY['Adventurous', 'Melancholic', 'Uplifting'], 'Tactical RPG', '30-60 hours', 'https://store.steampowered.com/app/763890/'),

('Coffee Talk', 'Brew coffee and listen to stories in an alternate Seattle. This visual novel explores relationships and life through late-night conversations.', 'Toge Productions', 'https://images.unsplash.com/photo-1511920170033-f8396924c348?w=800', 2020, ARRAY['Cozy', 'Peaceful', 'Melancholic'], 'Visual Novel', '5-8 hours', 'https://store.steampowered.com/app/914800/'),

('Manifold Garden', 'Explore an impossible world of infinite architecture. Manipulate gravity and perspective in this mind-bending puzzle game.', 'William Chyr', 'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=800', 2019, ARRAY['Meditative', 'Mysterious', 'Surreal'], 'Puzzle', '8-12 hours', 'https://store.steampowered.com/app/473950/'),

('Kentucky Route Zero', 'A magical realist adventure about a secret highway in Kentucky. This episodic narrative explores debt, loss, and Americana.', 'Cardboard Computer', 'https://images.unsplash.com/photo-1509390144843-c0ca2228e23f?w=800', 2020, ARRAY['Melancholic', 'Mysterious', 'Surreal'], 'Narrative Adventure', '8-12 hours', 'https://store.steampowered.com/app/231200/'),

('Sable', 'Explore a desert planet on a hoverbike. Coming-of-age story meets exploration in this gorgeous cel-shaded adventure.', 'Shedworks', 'https://images.unsplash.com/photo-1509390144843-c0ca2228e23f?w=800', 2021, ARRAY['Peaceful', 'Adventurous', 'Meditative'], 'Exploration Adventure', '10-15 hours', 'https://store.steampowered.com/app/757310/'),

('The Forgotten City', 'A Roman mystery thriller that explores morality and time loops. Your choices determine who lives and who dies.', 'Modern Storyteller', 'https://images.unsplash.com/photo-1582834817041-159b7bb1ee58?w=800', 2021, ARRAY['Mysterious', 'Dark', 'Challenging'], 'Mystery Adventure', '8-12 hours', 'https://store.steampowered.com/app/874260/'),

('Rain World', 'Survive as a slugcat in a broken ecosystem. This brutally difficult survival platformer features complex AI and dynamic weather.', 'Videocult', 'https://images.unsplash.com/photo-1579567761406-4684ee0c75b6?w=800', 2017, ARRAY['Dark', 'Challenging', 'Mysterious'], 'Survival Platformer', '20-40 hours', 'https://store.steampowered.com/app/312520/'),

('Chicory: A Colorful Tale', 'Paint a black-and-white world with color in this top-down adventure. A heartfelt story about art, anxiety, and self-expression.', 'Greg Lobanov', 'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=800', 2021, ARRAY['Cozy', 'Uplifting', 'Peaceful'], 'Adventure', '12-18 hours', 'https://store.steampowered.com/app/1123450/'),

('Obra Dinn', 'Solve the mystery of a ghost ship using a magical watch. This unique detective game features stunning 1-bit art.', 'Lucas Pope', 'https://images.unsplash.com/photo-1582834817041-159b7bb1ee58?w=800', 2018, ARRAY['Mysterious', 'Challenging', 'Dark'], 'Mystery Puzzle', '10-15 hours', 'https://store.steampowered.com/app/653530/'),

('Outer Wilds', 'Explore a solar system trapped in a time loop. Uncover ancient mysteries in this space exploration masterpiece.', 'Mobius Digital', 'https://images.unsplash.com/photo-1614732414444-096e5f1122d5?w=800', 2019, ARRAY['Mysterious', 'Adventurous', 'Uplifting'], 'Space Exploration', '15-25 hours', 'https://store.steampowered.com/app/753640/'),

('Cult of the Lamb', 'Build your own cult in a land of false prophets. Combine roguelike dungeon crawling with cult management simulation.', 'Massive Monster', 'https://images.unsplash.com/photo-1566577739112-5180d4bf9390?w=800', 2022, ARRAY['Dark', 'Whimsical', 'Challenging'], 'Rogue-like Management', '20-30 hours', 'https://store.steampowered.com/app/1313140/'),

('Vampire Survivors', 'Survive hordes of monsters until dawn in this minimalist roguelite. Addictive upgrade loops and power fantasies await.', 'poncle', 'https://images.unsplash.com/photo-1579567761406-4684ee0c75b6?w=800', 2022, ARRAY['Challenging', 'Dark', 'Whimsical'], 'Rogue-lite Survivor', '30+ hours', 'https://store.steampowered.com/app/1794680/'),

('Eastward', 'A beautiful pixel-art adventure through a post-apocalyptic world. Play as a miner and mysterious girl on an emotional journey.', 'Pixpil', 'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=800', 2021, ARRAY['Cozy', 'Melancholic', 'Adventurous'], 'Action Adventure', '20-30 hours', 'https://store.steampowered.com/app/977880/'),

('Inscryption', 'A psychological horror deck-builder that breaks the fourth wall. Mix cards, puzzles, and escape rooms in this unsettling roguelike.', 'Daniel Mullins', 'https://images.unsplash.com/photo-1577741314755-048d8525d31e?w=800', 2021, ARRAY['Dark', 'Mysterious', 'Surreal'], 'Deck-builder Horror', '12-18 hours', 'https://store.steampowered.com/app/1092790/'),

('Townscaper', 'Build beautiful seaside towns with simple clicks. This relaxing toy lets you create stunning architecture with no goals or stress.', 'Oskar Stalberg', 'https://images.unsplash.com/photo-1560493676-04071c5f467b?w=800', 2021, ARRAY['Peaceful', 'Cozy', 'Meditative'], 'Creative Toy', '5-10 hours', 'https://store.steampowered.com/app/1291340/'),

('Neon White', 'A lightning-fast FPS where you race through Heaven. Speedrun levels using cards as weapons and movement abilities.', 'Angel Matrix', 'https://images.unsplash.com/photo-1552820728-8b83bb6b773f?w=800', 2022, ARRAY['Challenging', 'Uplifting', 'Surreal'], 'FPS Platformer', '8-12 hours', 'https://store.steampowered.com/app/1533420/'),

('Carrion', 'Be the monster in this reverse horror game. Control a tentacled creature escaping from a facility and consuming everything in your path.', 'Phobia Game Studio', 'https://images.unsplash.com/photo-1579567761406-4684ee0c75b6?w=800', 2020, ARRAY['Dark', 'Challenging', 'Surreal'], 'Metroidvania Horror', '5-8 hours', 'https://store.steampowered.com/app/953490/'),

('Moonlighter', 'Run a shop by day and explore dungeons by night. This action RPG blends shopkeeping with roguelike dungeon crawling.', 'Digital Sun', 'https://images.unsplash.com/photo-1569003339405-ea396a5a8a90?w=800', 2018, ARRAY['Adventurous', 'Cozy', 'Challenging'], 'Action RPG', '15-25 hours', 'https://store.steampowered.com/app/606150/'),

('Oxenfree', 'A supernatural thriller about a group of friends on an island. Your dialogue choices shape relationships and story outcomes.', 'Night School Studio', 'https://images.unsplash.com/photo-1509390144843-c0ca2228e23f?w=800', 2016, ARRAY['Mysterious', 'Melancholic', 'Dark'], 'Narrative Adventure', '4-6 hours', 'https://store.steampowered.com/app/388880/'),

('Death''s Door', 'Play as a crow reaping souls for the Reaping Commission. This isometric adventure features tight combat and gorgeous environments.', 'Acid Nerve', 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=800', 2021, ARRAY['Challenging', 'Adventurous', 'Melancholic'], 'Action Adventure', '10-15 hours', 'https://store.steampowered.com/app/894020/'),

('Mini Motorways', 'Draw roads to keep your city moving. This minimalist strategy puzzle game is easy to learn but hard to master.', 'Dinosaur Polo Club', 'https://images.unsplash.com/photo-1449824913935-59a10b8d2000?w=800', 2021, ARRAY['Meditative', 'Challenging', 'Peaceful'], 'Strategy Puzzle', '20+ hours', 'https://store.steampowered.com/app/1127500/'),

('The Artful Escape', 'A psychedelic musical journey about a teenage musician. Shred through fantastical worlds in this narrative adventure.', 'Beethoven & Dinosaur', 'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=800', 2021, ARRAY['Surreal', 'Uplifting', 'Peaceful'], 'Musical Adventure', '4-6 hours', 'https://store.steampowered.com/app/1113230/'),

('Webbed', 'Swing through the trees as a tiny spider on a big adventure. Physics-based platforming with adorable art and web mechanics.', 'Sbug Games', 'https://images.unsplash.com/photo-1566577739112-5180d4bf9390?w=800', 2021, ARRAY['Cozy', 'Whimsical', 'Peaceful'], 'Physics Platformer', '3-5 hours', 'https://store.steampowered.com/app/1390350/'),

('Tinykin', 'Explore a giant house as a tiny alien. Command swarms of creatures to solve puzzles in this charming 3D platformer.', 'Splashteam', 'https://images.unsplash.com/photo-1560493676-04071c5f467b?w=800', 2022, ARRAY['Cozy', 'Adventurous', 'Peaceful'], 'Puzzle Platformer', '8-12 hours', 'https://store.steampowered.com/app/1599020/'),

('Turnip Boy Commits Tax Evasion', 'Be a turnip who tears up tax documents and causes chaos. This quirky adventure parodies Zelda-style gameplay.', 'Snoozy Kazoo', 'https://images.unsplash.com/photo-1560493676-04071c5f467b?w=800', 2021, ARRAY['Whimsical', 'Uplifting', 'Cozy'], 'Adventure', '3-5 hours', 'https://store.steampowered.com/app/1205450/'),

('Blasphemous 2', 'Return to the nightmarish world of Cvstodia in this brutal Metroidvania sequel. Precise combat and grotesque art await.', 'The Game Kitchen', 'https://images.unsplash.com/photo-1509347528160-9a9e33742cdb?w=800', 2023, ARRAY['Dark', 'Challenging', 'Melancholic'], 'Metroidvania', '15-25 hours', 'https://store.steampowered.com/app/2114740/'),

('Pizza Tower', 'A manic platformer inspired by Wario Land. Break through levels at breakneck speed with incredibly expressive animation.', 'Tour De Pizza', 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=800', 2023, ARRAY['Challenging', 'Whimsical', 'Uplifting'], 'Platformer', '8-12 hours', 'https://store.steampowered.com/app/2231450/'),

('Dredge', 'Fish by day, explore by night in this sinister fishing adventure. Uncover secrets in a mysterious archipelago.', 'Black Salt Games', 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=800', 2023, ARRAY['Dark', 'Mysterious', 'Meditative'], 'Fishing Adventure', '12-18 hours', 'https://store.steampowered.com/app/1562430/'),

('Cocoon', 'Jump between worlds carried on your back in this puzzle adventure. From the creators of Limbo and Inside.', 'Geometric Interactive', 'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=800', 2023, ARRAY['Mysterious', 'Peaceful', 'Surreal'], 'Puzzle Adventure', '5-8 hours', 'https://store.steampowered.com/app/1497440/'),

('Viewfinder', 'Reshape reality by taking photographs. This mind-bending puzzle game explores perspective and perception.', 'Sad Owl Studios', 'https://images.unsplash.com/photo-1511292966611-492f06f960bc?w=800', 2023, ARRAY['Surreal', 'Challenging', 'Peaceful'], 'Puzzle', '6-10 hours', 'https://store.steampowered.com/app/1382070/'),

('Dave the Diver', 'Run a sushi restaurant and explore the ocean depths. This hybrid adventure blends diving, fishing, and restaurant management.', 'MINTROCKET', 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=800', 2023, ARRAY['Cozy', 'Adventurous', 'Uplifting'], 'Adventure Management', '25-40 hours', 'https://store.steampowered.com/app/1868140/'),

('Blasphemous', 'Explore a nightmarish world inspired by Spanish Catholicism. This brutal Metroidvania features grotesque pixel art and punishing combat.', 'The Game Kitchen', 'https://images.unsplash.com/photo-1509347528160-9a9e33742cdb?w=800', 2019, ARRAY['Dark', 'Challenging', 'Melancholic'], 'Metroidvania', '15-25 hours', 'https://store.steampowered.com/app/774361/'),

('Backbone', 'A post-noir narrative adventure set in a dystopian Vancouver. Play as a raccoon private investigator uncovering dark conspiracies.', 'EggNut', 'https://images.unsplash.com/photo-1509390144843-c0ca2228e23f?w=800', 2021, ARRAY['Dark', 'Mysterious', 'Melancholic'], 'Narrative Adventure', '6-8 hours', 'https://store.steampowered.com/app/865610/'),

('Haven', 'Play as two lovers escaping to a lost planet. Explore, glide, and fight together in this romantic RPG adventure.', 'The Game Bakers', 'https://images.unsplash.com/photo-1614732414444-096e5f1122d5?w=800', 2020, ARRAY['Peaceful', 'Uplifting', 'Cozy'], 'Adventure RPG', '12-18 hours', 'https://store.steampowered.com/app/983970/'),

('Islanders', 'A minimalist city-building puzzle game. Place buildings strategically to earn points and unlock new structures.', 'GrizzlyGames', 'https://images.unsplash.com/photo-1560493676-04071c5f467b?w=800', 2019, ARRAY['Peaceful', 'Meditative', 'Cozy'], 'Puzzle Strategy', '10-20 hours', 'https://store.steampowered.com/app/1046030/'),

('The Case of the Golden Idol', 'Solve 12 strange deaths in this deduction puzzle game. Piece together evidence and timelines to uncover a conspiracy.', 'Color Gray Games', 'https://images.unsplash.com/photo-1577741314755-048d8525d31e?w=800', 2022, ARRAY['Mysterious', 'Challenging', 'Dark'], 'Mystery Puzzle', '8-12 hours', 'https://store.steampowered.com/app/1677770/');