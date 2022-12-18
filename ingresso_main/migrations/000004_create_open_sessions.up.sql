CREATE TABLE movie_sessions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    cinema_id INT NOT NULL,
    room_id INT NOT NULL,
    movie_id INT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    end_time INT NOT NULL
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
);

ALTER TABLE movie_sessions ADD CONSTRAINT movie_sessions_cinema_id_fk FOREIGN KEY (cinema_id) REFERENCES cinemas(id) ON DELETE CASCADE;
ALTER TABLE movie_sessions ADD CONSTRAINT movie_sessions_movie_id_fk FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE;
ALTER TABLE movie_sessions ADD CONSTRAINT movie_sessions_room_id_fk FOREIGN KEY (room_id) REFERENCES rooms(id) ON DELETE CASCADE;

COMMENTS ON TABLE movie_sessions IS 'Movie available sessions';

COMMENTS ON COLUMN movie_sessions.id IS 'Movie session ID';
COMMENTS ON COLUMN movie_sessions.movie_id IS 'Movie ID';
COMMENTS ON COLUMN movie_sessions.room_id IS 'Room ID';
COMMENTS ON COLUMN movie_sessions.start_time IS 'Start time of the movie session';
COMMENTS ON COLUMN movie_sessions.end_time IS 'End time of the movie session';
COMMENTS ON COLUMN movie_sessions.created_at IS 'Created at';
COMMENTS ON COLUMN movie_sessions.updated_at IS 'Updated at';
