/*
  # Add game store/play links

  1. Changes
    - Add `store_url` column to games table for linking to game stores (Steam, itch.io, etc.)
    - Add `play_url` column for direct play links (browser games)
  
  2. Notes
    - At least one URL should be provided per game
    - URLs should be valid HTTP/HTTPS links
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'games' AND column_name = 'store_url'
  ) THEN
    ALTER TABLE games ADD COLUMN store_url text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'games' AND column_name = 'play_url'
  ) THEN
    ALTER TABLE games ADD COLUMN play_url text;
  END IF;
END $$;