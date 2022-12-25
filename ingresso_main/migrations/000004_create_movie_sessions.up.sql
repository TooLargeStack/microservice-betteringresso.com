CREATE TABLE movie_sessions (
    id UUID DEFAULT uuid_generate_v4(),
    cine_id UUID NOT NULL,
    room_id UUID NOT NULL,
    movie_id UUID NOT NULL,
    reserved_seats JSONB NOT NULL DEFAULT '{}'::JSONB,
    start_time TIMESTAMP WITH TIME ZONE NOT NULL,
    end_time TIMESTAMP WITH TIME ZONE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

ALTER TABLE movie_sessions ADD CONSTRAINT pk_movie_sessions PRIMARY KEY (id);
ALTER TABLE movie_sessions ADD CONSTRAINT fk_movie_sessions_cine_id FOREIGN KEY (cine_id) REFERENCES cines(id) ON DELETE CASCADE;
ALTER TABLE movie_sessions ADD CONSTRAINT fk_movie_sessions_movie_id FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE;
ALTER TABLE movie_sessions ADD CONSTRAINT fk_movie_sessions_room_id FOREIGN KEY (room_id) REFERENCES rooms(id) ON DELETE CASCADE;

CREATE INDEX idx_movie_sessions_cine_id ON movie_sessions (cine_id);
CREATE INDEX idx_movie_sessions_movie_id ON movie_sessions (movie_id);
CREATE INDEX idx_movie_sessions_room_id ON movie_sessions (room_id);
CREATE INDEX idx_movie_sessions_start_time ON movie_sessions (start_time);
CREATE UNIQUE INDEX idx_movie_sessions_cine_id_movie_id ON movie_sessions (cine_id, movie_id);
CREATE UNIQUE INDEX idx_movie_sessions_cine_id_movie_id_room_id ON movie_sessions (cine_id, movie_id, room_id);
CREATE UNIQUE INDEX idx_movie_sessions_cine_id_movie_id_start_time ON movie_sessions (cine_id, movie_id, start_time);
CREATE UNIQUE INDEX idx_movie_sessions_movie_id_start_time_reserved_seats ON movie_sessions (movie_id, start_time, reserved_seats);


COMMENT ON TABLE movie_sessions IS 'Movie available sessions';

COMMENT ON COLUMN movie_sessions.id IS 'Movie session ID';
COMMENT ON COLUMN movie_sessions.cine_id IS 'Cine ID';
COMMENT ON COLUMN movie_sessions.movie_id IS 'Movie ID';
COMMENT ON COLUMN movie_sessions.room_id IS 'Room ID';
COMMENT ON COLUMN movie_sessions.reserved_seats IS 'Reserved seats';
COMMENT ON COLUMN movie_sessions.start_time IS 'The time when started the movie';
COMMENT ON COLUMN movie_sessions.end_time IS 'The time when finished the movie';
COMMENT ON COLUMN movie_sessions.created_at IS 'The time when the movie session was created';
COMMENT ON COLUMN movie_sessions.updated_at IS 'The time when the movie session was last updated';
