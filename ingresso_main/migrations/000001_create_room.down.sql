ALTER TABLE rooms DROP CONSTRAINT rooms_type_idx;
ALTER TABLE rooms DROP CONSTRAINT rooms_capacity_idx;
ALTER TABLE rooms DROP CONSTRAINT rooms_pkey;

DROP TABLE IF EXISTS rooms;

DROP TYPE room_type_enum CASCADE;

DROP EXTENSION IF EXISTS uuid-ossp;