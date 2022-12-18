CREATE TABLE movies (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title VARCHAR(50) NOT NULL,
    image VARCHAR(255) NOT NULL,
    released_year INT NOT NULL,
    minutes INT NOT NULL,
    genre ENUM('ACTION', 'ADVENTURE', 'ANIMATION', 'BIOGRAPHY', 'COMEDY', 'CRIME', 'DRAMA', 'FAMILY', 'FANTASY', 'HISTORY', 'HORROR', 'MUSICAL', 'MYSTERY', 'SCI-FI', 'THRILLER', 'WAR', 'ROMANCE') NOT NULL,
    synopsis TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
);

COMMENT ON TABLE movies IS 'Contains all the movies';

COMMENT ON COLUMN movies.title IS 'The title of the movie';
COMMENT ON COLUMN movies.released_year IS 'The year the movie was released';
COMMENT ON COLUMN movies.minutes IS 'The length of the movie in minutes';
COMMENT ON COLUMN movies.genre IS 'The genre of the movie';
COMMENT ON COLUMN movies.synopsis IS 'The synopsis of the movie';
