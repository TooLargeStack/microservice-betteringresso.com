CREATE TABLE movie_sessions (
    id UUID DEFAULT uuid_generate_v4(),
    cine_id INT NOT NULL,
    room_id INT NOT NULL,
    movie_id INT NOT NULL,
    start_time TIMESTAMP WITH TIME ZONE NOT NULL,
    end_time TIMESTAMP WITH TIME ZONE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

ALTER TABLE movie_sessions ADD CONSTRAINT movie_sessions_pkey PRIMARY KEY (id);
ALTER TABLE movie_sessions ADD CONSTRAINT movie_sessions_cine_id_fkey FOREIGN KEY (cine_id) REFERENCES cines(id) ON DELETE CASCADE;
ALTER TABLE movie_sessions ADD CONSTRAINT movie_sessions_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE;
ALTER TABLE movie_sessions ADD CONSTRAINT movie_sessions_room_id_fkey FOREIGN KEY (room_id) REFERENCES rooms(id) ON DELETE CASCADE;

CREATE INDEX movie_sessions_cine_id_idx ON movie_sessions (cine_id);
CREATE INDEX movie_sessions_movie_id_idx ON movie_sessions (movie_id);
CREATE INDEX movie_sessions_room_id_idx ON movie_sessions (room_id);
CREATE INDEX movie_sessions_start_at_idx ON movie_sessions (start_at);
CREATE UNIQUE INDEX movie_sessions_cine_id_movie_id_idx ON movie_sessions (cine_id, movie_id);
CREATE UNIQUE INDEX movie_sessions_cine_id_movie_id_room_id_idx ON movie_sessions (cine_id, movie_id, room_id);
CREATE UNIQUE INDEX movie_sessions_cine_id_movie_id_start_time_idx ON movie_sessions (cine_id, movie_id, start_time);


COMMENT ON TABLE movie_sessions IS 'Movie available sessions';

COMMENT ON COLUMN movie_sessions.id IS 'Movie session ID';
COMMENT ON COLUMN movie_sessions.cine_id IS 'Cine ID';
COMMENT ON COLUMN movie_sessions.movie_id IS 'Movie ID';
COMMENT ON COLUMN movie_sessions.room_id IS 'Room ID';
COMMENT ON COLUMN movie_sessions.start_time IS 'The time when started the movie';
COMMENT ON COLUMN movie_sessions.end_time IS 'The time when finished the movie';
COMMENT ON COLUMN movie_sessions.created_at IS 'The time when the movie session was created';
COMMENT ON COLUMN movie_sessions.updated_at IS 'The time when the movie session was last updated';
