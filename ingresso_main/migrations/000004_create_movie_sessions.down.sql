ALTER TABLE IF EXISTS movie_sessions DROP CONSTRAINT IF EXISTS "idx_movie_sessions_movie_id_start_time_reserved_seats";
ALTER TABLE IF EXISTS movie_sessions DROP CONSTRAINT IF EXISTS "idx_movie_sessions_cine_id_movie_id_start_time";
ALTER TABLE IF EXISTS movie_sessions DROP CONSTRAINT IF EXISTS "idx_movie_sessions_cine_id_movie_id_room_id";
ALTER TABLE IF EXISTS movie_sessions DROP CONSTRAINT IF EXISTS "idx_movie_sessions_cine_id_movie_id";
ALTER TABLE IF EXISTS movie_sessions DROP CONSTRAINT IF EXISTS "idx_movie_sessions_start_at";
ALTER TABLE IF EXISTS movie_sessions DROP CONSTRAINT IF EXISTS "idx_movie_sessions_room_id";
ALTER TABLE IF EXISTS movie_sessions DROP CONSTRAINT IF EXISTS "idx_movie_sessions_movie_id";
ALTER TABLE IF EXISTS movie_sessions DROP CONSTRAINT IF EXISTS "idx_movie_sessions_cine_id";

ALTER TABLE IF EXISTS movie_sessions DROP CONSTRAINT IF EXISTS "fk_movie_sessions_room_id";
ALTER TABLE IF EXISTS movie_sessions DROP CONSTRAINT IF EXISTS "fk_movie_sessions_movie_id";
ALTER TABLE IF EXISTS movie_sessions DROP CONSTRAINT IF EXISTS "fk_movie_sessions_cine_id";
ALTER TABLE IF EXISTS movie_sessions DROP CONSTRAINT IF EXISTS "pk_movie_sessions";


DROP TABLE IF EXISTS movie_sessions;