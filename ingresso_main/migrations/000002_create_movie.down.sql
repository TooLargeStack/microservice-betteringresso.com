ALTER TABLE movies DROP CONSTRAINT IF EXISTS idx_movies_genre;
ALTER TABLE movies DROP CONSTRAINT IF EXISTS idx_movies_minutes;
ALTER TABLE movies DROP CONSTRAINT IF EXISTS idx_movies_released_year;
ALTER TABLE movies DROP CONSTRAINT IF EXISTS idx_movies_title;
ALTER TABLE movies DROP CONSTRAINT IF EXISTS pk_movies;

DROP TABLE IF EXISTS movies;

DROP TYPE room_type_enum CASCADE;
