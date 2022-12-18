ALTER TABLE movies DROP CONSTRAINT IF EXISTS movies_genre_idx;
ALTER TABLE movies DROP CONSTRAINT IF EXISTS movies_minutes_idx;
ALTER TABLE movies DROP CONSTRAINT IF EXISTS movies_released_year_idx;
ALTER TABLE movies DROP CONSTRAINT IF EXISTS movies_title_idx;
ALTER TABLE movies DROP CONSTRAINT IF EXISTS movies_pkey;

DROP TABLE IF EXISTS movies;

DROP TYPE room_type_enum CASCADE;
