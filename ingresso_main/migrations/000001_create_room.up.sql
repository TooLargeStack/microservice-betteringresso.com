CREATE TABLE rooms (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    capacity INTEGER NOT NULL,
    type ENUM('DEFAULT_ROOM', 'VIP_ROOM', 'PREMIUM_ROOM', 'IMAX_ROOM', 'OTHER_ROOM') NOT NULL DEFAULT 'DEFAULT_ROOM',
    seats JSONB NOT NULL DEFAULT '{}'::JSONB,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),

    PRIMARY KEY (id)
);

COMMENT ON TABLE rooms IS 'The rooms in the cinema';

COMMENT ON COLUMN rooms.id IS 'The unique identifier for the room';
COMMENT ON COLUMN rooms.capacity IS 'The maximum number of people that can be in the room at the same time';
COMMENT ON COLUMN rooms.type IS 'The type of the room';
COMMENT ON COLUMN rooms.chairs IS 'The chairs in the room';
COMMENT ON COLUMN rooms.created_at IS 'The time when the room was created';
COMMENT ON COLUMN rooms.updated_at IS 'The time when the room was last updated';
