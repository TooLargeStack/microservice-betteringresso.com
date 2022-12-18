ALTER TABLE IF EXISTS movie_sessions DROP CONSTRAINT IF EXISTS "movie_sessions_cine_id_movie_id_start_time_idx";
ALTER TABLE IF EXISTS movie_sessions DROP CONSTRAINT IF EXISTS "movie_sessions_cine_id_movie_id_room_id_idx";
ALTER TABLE IF EXISTS movie_sessions DROP CONSTRAINT IF EXISTS "movie_sessions_cine_id_movie_id_idx";
ALTER TABLE IF EXISTS movie_sessions DROP CONSTRAINT IF EXISTS "movie_sessions_start_at_idx";
ALTER TABLE IF EXISTS movie_sessions DROP CONSTRAINT IF EXISTS "movie_sessions_room_id_idx";
ALTER TABLE IF EXISTS movie_sessions DROP CONSTRAINT IF EXISTS "movie_sessions_movie_id_idx";
ALTER TABLE IF EXISTS movie_sessions DROP CONSTRAINT IF EXISTS "movie_sessions_cine_id_idx";

ALTER TABLE IF EXISTS movie_sessions DROP CONSTRAINT IF EXISTS "movie_sessions_room_id_fkey";
ALTER TABLE IF EXISTS movie_sessions DROP CONSTRAINT IF EXISTS "movie_sessions_movie_id_fkey";
ALTER TABLE IF EXISTS movie_sessions DROP CONSTRAINT IF EXISTS "movie_sessions_cine_id_fkey";
ALTER TABLE IF EXISTS movie_sessions DROP CONSTRAINT IF EXISTS "movie_sessions_pkey";


DROP TABLE IF EXISTS movie_sessions;