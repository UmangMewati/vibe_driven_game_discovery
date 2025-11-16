/*
  # GameSoul Database Schema

  ## Overview
  Complete database schema for GameSoul - a vibe-driven indie game discovery platform.
  
  ## New Tables
  
  ### 1. `profiles`
  User profiles linked to auth.users
  - `id` (uuid, primary key) - References auth.users
  - `username` (text, unique) - Display name
  - `bio` (text) - User bio
  - `taste_profile` (jsonb) - Semantic taste preferences
  - `created_at` (timestamptz)
  - `updated_at` (timestamptz)
  
  ### 2. `games`
  Indie game catalog
  - `id` (uuid, primary key)
  - `title` (text) - Game title
  - `description` (text) - Game description
  - `developer` (text) - Developer name
  - `cover_image` (text) - Cover image URL
  - `release_year` (integer) - Release year
  - `vibe_tags` (text[]) - Array of vibe/mood tags
  - `semantic_vector` (jsonb) - Semantic embeddings for matching
  - `gameplay_style` (text) - Type of gameplay
  - `estimated_hours` (text) - Play time estimate
  - `created_at` (timestamptz)
  
  ### 3. `vibes`
  Predefined vibe/mood categories
  - `id` (uuid, primary key)
  - `name` (text, unique) - Vibe name
  - `description` (text) - Vibe description
  - `color` (text) - Display color
  - `emoji` (text) - Representative emoji
  - `created_at` (timestamptz)
  
  ### 4. `user_favorites`
  User's favorited games
  - `id` (uuid, primary key)
  - `user_id` (uuid) - References profiles
  - `game_id` (uuid) - References games
  - `created_at` (timestamptz)
  - Unique constraint on (user_id, game_id)
  
  ### 5. `user_collections`
  User-created collections
  - `id` (uuid, primary key)
  - `user_id` (uuid) - References profiles
  - `name` (text) - Collection name
  - `description` (text) - Collection description
  - `is_public` (boolean) - Visibility setting
  - `created_at` (timestamptz)
  
  ### 6. `collection_games`
  Games within collections
  - `id` (uuid, primary key)
  - `collection_id` (uuid) - References user_collections
  - `game_id` (uuid) - References games
  - `added_at` (timestamptz)
  - Unique constraint on (collection_id, game_id)
  
  ## Security
  - Enable RLS on all tables
  - Profiles: Users can view all profiles, but only update their own
  - Games: Public read access, admin write (for now)
  - Vibes: Public read access
  - Favorites: Users can only manage their own favorites
  - Collections: Users manage their own, can view public collections
  - Collection games: Managed by collection owner
*/

-- Create profiles table
CREATE TABLE IF NOT EXISTS profiles (
  id uuid PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  username text UNIQUE NOT NULL,
  bio text DEFAULT '',
  taste_profile jsonb DEFAULT '{}',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Create games table
CREATE TABLE IF NOT EXISTS games (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  description text NOT NULL,
  developer text NOT NULL,
  cover_image text,
  release_year integer,
  vibe_tags text[] DEFAULT '{}',
  semantic_vector jsonb DEFAULT '{}',
  gameplay_style text,
  estimated_hours text,
  created_at timestamptz DEFAULT now()
);

-- Create vibes table
CREATE TABLE IF NOT EXISTS vibes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text UNIQUE NOT NULL,
  description text NOT NULL,
  color text NOT NULL,
  emoji text,
  created_at timestamptz DEFAULT now()
);

-- Create user_favorites table
CREATE TABLE IF NOT EXISTS user_favorites (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  game_id uuid NOT NULL REFERENCES games(id) ON DELETE CASCADE,
  created_at timestamptz DEFAULT now(),
  UNIQUE(user_id, game_id)
);

-- Create user_collections table
CREATE TABLE IF NOT EXISTS user_collections (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  name text NOT NULL,
  description text DEFAULT '',
  is_public boolean DEFAULT false,
  created_at timestamptz DEFAULT now()
);

-- Create collection_games table
CREATE TABLE IF NOT EXISTS collection_games (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  collection_id uuid NOT NULL REFERENCES user_collections(id) ON DELETE CASCADE,
  game_id uuid NOT NULL REFERENCES games(id) ON DELETE CASCADE,
  added_at timestamptz DEFAULT now(),
  UNIQUE(collection_id, game_id)
);

-- Enable RLS
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE games ENABLE ROW LEVEL SECURITY;
ALTER TABLE vibes ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_favorites ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_collections ENABLE ROW LEVEL SECURITY;
ALTER TABLE collection_games ENABLE ROW LEVEL SECURITY;

-- Profiles policies
CREATE POLICY "Public profiles are viewable by everyone"
  ON profiles FOR SELECT
  TO authenticated, anon
  USING (true);

CREATE POLICY "Users can insert their own profile"
  ON profiles FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = id);

CREATE POLICY "Users can update their own profile"
  ON profiles FOR UPDATE
  TO authenticated
  USING (auth.uid() = id)
  WITH CHECK (auth.uid() = id);

-- Games policies (public read)
CREATE POLICY "Games are viewable by everyone"
  ON games FOR SELECT
  TO authenticated, anon
  USING (true);

-- Vibes policies (public read)
CREATE POLICY "Vibes are viewable by everyone"
  ON vibes FOR SELECT
  TO authenticated, anon
  USING (true);

-- User favorites policies
CREATE POLICY "Users can view their own favorites"
  ON user_favorites FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Users can add their own favorites"
  ON user_favorites FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete their own favorites"
  ON user_favorites FOR DELETE
  TO authenticated
  USING (auth.uid() = user_id);

-- User collections policies
CREATE POLICY "Users can view their own collections"
  ON user_collections FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Public collections are viewable by everyone"
  ON user_collections FOR SELECT
  TO authenticated, anon
  USING (is_public = true);

CREATE POLICY "Users can create their own collections"
  ON user_collections FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own collections"
  ON user_collections FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete their own collections"
  ON user_collections FOR DELETE
  TO authenticated
  USING (auth.uid() = user_id);

-- Collection games policies
CREATE POLICY "Users can view games in their collections"
  ON collection_games FOR SELECT
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM user_collections
      WHERE user_collections.id = collection_games.collection_id
      AND user_collections.user_id = auth.uid()
    )
  );

CREATE POLICY "Anyone can view games in public collections"
  ON collection_games FOR SELECT
  TO authenticated, anon
  USING (
    EXISTS (
      SELECT 1 FROM user_collections
      WHERE user_collections.id = collection_games.collection_id
      AND user_collections.is_public = true
    )
  );

CREATE POLICY "Users can add games to their collections"
  ON collection_games FOR INSERT
  TO authenticated
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM user_collections
      WHERE user_collections.id = collection_games.collection_id
      AND user_collections.user_id = auth.uid()
    )
  );

CREATE POLICY "Users can remove games from their collections"
  ON collection_games FOR DELETE
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM user_collections
      WHERE user_collections.id = collection_games.collection_id
      AND user_collections.user_id = auth.uid()
    )
  );

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_games_vibe_tags ON games USING GIN (vibe_tags);
CREATE INDEX IF NOT EXISTS idx_user_favorites_user_id ON user_favorites(user_id);
CREATE INDEX IF NOT EXISTS idx_user_favorites_game_id ON user_favorites(game_id);
CREATE INDEX IF NOT EXISTS idx_user_collections_user_id ON user_collections(user_id);
CREATE INDEX IF NOT EXISTS idx_collection_games_collection_id ON collection_games(collection_id);
CREATE INDEX IF NOT EXISTS idx_collection_games_game_id ON collection_games(game_id);