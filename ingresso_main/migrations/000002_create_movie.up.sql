CREATE TYPE movies_genre_enum AS ENUM ('ACTION', 'ADVENTURE', 'ANIMATION', 'BIOGRAPHY', 'COMEDY', 'CRIME', 'DRAMA', 'FAMILY', 'FANTASY', 'HISTORY', 'HORROR', 'MUSICAL', 'MYSTERY', 'SCI-FI', 'THRILLER', 'WAR', 'ROMANCE');

CREATE TABLE movies (
    id UUID DEFAULT uuid_generate_v4(),
    title VARCHAR(50) NOT NULL,
    image VARCHAR(255) NOT NULL,
    released_year INT NOT NULL,
    minutes INT NOT NULL,
    genre movies_genre_enum NOT NULL,
    synopsis TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

ALTER TABLE movies ADD CONSTRAINT pk_movies PRIMARY KEY (id);

CREATE INDEX idx_movies_title ON movies (title);
CREATE INDEX idx_movies_released_year ON movies (released_year);
CREATE INDEX idx_movies_minutes ON movies (minutes);
CREATE INDEX idx_movies_genre ON movies (genre);

COMMENT ON TABLE movies IS 'Contains all the movies';

COMMENT ON COLUMN movies.title IS 'The title of the movie';
COMMENT ON COLUMN movies.released_year IS 'The year the movie was released';
COMMENT ON COLUMN movies.minutes IS 'The length of the movie in minutes';
COMMENT ON COLUMN movies.genre IS 'The genre of the movie';
COMMENT ON COLUMN movies.synopsis IS 'The synopsis of the movie';
COMMENT ON COLUMN movies.created_at IS 'The date and time the movie was created';
COMMENT ON COLUMN movies.updated_at IS 'The date and time the movie was last updated';
