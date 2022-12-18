CREATE TABLE cines (
    id UUID DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    phone INTEGER NOT NULL,
    website VARCHAR(255) NOT NULL,
    address VARCHAR(100) NOT NULL,
    zip INTEGER NOT NULL,
    city VARCHAR(20) NOT NULL,
    state VARCHAR(20) NOT NULL,
    country VARCHAR(20) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

ALTER TABLE cines ADD CONSTRAINT cine_pkey PRIMARY KEY (id);

CREATE INDEX cines_name_idx ON cines (name);

COMMENT ON TABLE cines IS 'Cines table';

COMMENT ON COLUMN cines.id IS 'Cine ID';
COMMENT ON COLUMN cines.name IS 'Cine name';
COMMENT ON COLUMN cines.address IS 'Cine address';
COMMENT ON COLUMN cines.zip IS 'Cine zip code';
COMMENT ON COLUMN cines.city IS 'Cine city';
COMMENT ON COLUMN cines.state IS 'Cine state';
COMMENT ON COLUMN cines.country IS 'Cine country';
COMMENT ON COLUMN cines.phone IS 'Cine phone number';
COMMENT ON COLUMN cines.website IS 'Cine website';
COMMENT ON COLUMN cines.created_at IS 'Cine creation date';
COMMENT ON COLUMN cines.created_at IS 'The time when the cine was created';
COMMENT ON COLUMN cines.updated_at IS 'The time when the cine was last updated';
