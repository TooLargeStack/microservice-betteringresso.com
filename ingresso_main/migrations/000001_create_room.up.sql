CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TYPE room_type_enum AS ENUM ('DEFAULT_ROOM', 'VIP_ROOM', 'PREMIUM_ROOM', 'IMAX_ROOM', 'OTHER_ROOM');

CREATE TABLE rooms (
    id UUID DEFAULT uuid_generate_v4(),
    capacity INTEGER NOT NULL,
    type room_type_enum NOT NULL DEFAULT 'DEFAULT_ROOM',
    seats JSONB NOT NULL DEFAULT '{}'::JSONB,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

ALTER TABLE rooms ADD CONSTRAINT pk_rooms PRIMARY KEY (id);

CREATE INDEX idx_rooms_capacity ON rooms (capacity);
CREATE INDEX idx_rooms_type ON rooms (type);

COMMENT ON TABLE rooms IS 'The rooms in the cine';

COMMENT ON COLUMN rooms.id IS 'The unique identifier for the room';
COMMENT ON COLUMN rooms.capacity IS 'The maximum number of people that can be in the room at the same time';
COMMENT ON COLUMN rooms.type IS 'The type of the room';
COMMENT ON COLUMN rooms.seats IS 'The chairs in the room';
COMMENT ON COLUMN rooms.created_at IS 'The time when the room was created';
COMMENT ON COLUMN rooms.updated_at IS 'The time when the room was last updated';
