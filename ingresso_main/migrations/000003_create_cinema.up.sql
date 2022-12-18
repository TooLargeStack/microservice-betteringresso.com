CREATE TABLE cinemas (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone INTEGER NOT NULL,
    website VARCHAR(255) NOT NULL,
    address VARCHAR(100) NOT NULL,
    zip INTEGER NOT NULL,
    city VARCHAR(20) NOT NULL,
    state VARCHAR(20) NOT NULL,
    country VARCHAR(20) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
);

COMMENTS ON TABLE cinemas IS 'Cinemas table';

COMMENTS ON COLUMN cinemas.id IS 'Cinema ID';
COMMENTS ON COLUMN cinemas.name IS 'Cinema name';
COMMENTS ON COLUMN cinemas.address IS 'Cinema address';
COMMENTS ON COLUMN cinemas.zip IS 'Cinema zip code';
COMMENTS ON COLUMN cinemas.city IS 'Cinema city';
COMMENTS ON COLUMN cinemas.state IS 'Cinema state';
COMMENTS ON COLUMN cinemas.country IS 'Cinema country';
COMMENTS ON COLUMN cinemas.phone IS 'Cinema phone number';
COMMENTS ON COLUMN cinemas.website IS 'Cinema website';
COMMENTS ON COLUMN cinemas.created_at IS 'Cinema creation date';
COMMENTS ON COLUMN cinemas.updated_at IS 'Cinema update date';