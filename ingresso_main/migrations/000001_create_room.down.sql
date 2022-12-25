ALTER TABLE rooms DROP CONSTRAINT idx_rooms_type;
ALTER TABLE rooms DROP CONSTRAINT idx_rooms_capacity;
ALTER TABLE rooms DROP CONSTRAINT pk_rooms;

DROP TABLE IF EXISTS rooms;

DROP TYPE room_type_enum CASCADE;

DROP EXTENSION IF EXISTS uuid-ossp;