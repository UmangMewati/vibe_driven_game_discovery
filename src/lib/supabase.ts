import { createClient } from '@supabase/supabase-js';

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

export const supabase = createClient(supabaseUrl, supabaseAnonKey);

export type Game = {
  id: string;
  title: string;
  description: string;
  developer: string;
  cover_image: string | null;
  release_year: number | null;
  vibe_tags: string[];
  semantic_vector: Record<string, any>;
  gameplay_style: string | null;
  estimated_hours: string | null;
  store_url: string | null;
  play_url: string | null;
  created_at: string;
};

export type Vibe = {
  id: string;
  name: string;
  description: string;
  color: string;
  emoji: string | null;
  created_at: string;
};

export type Profile = {
  id: string;
  username: string;
  bio: string;
  taste_profile: Record<string, any>;
  created_at: string;
  updated_at: string;
};

export type UserFavorite = {
  id: string;
  user_id: string;
  game_id: string;
  created_at: string;
};

export type UserCollection = {
  id: string;
  user_id: string;
  name: string;
  description: string;
  is_public: boolean;
  created_at: string;
};
