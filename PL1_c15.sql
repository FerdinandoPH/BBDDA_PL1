\c pl1

BEGIN;

CREATE INDEX IF NOT EXISTS idx_hash_producto_id ON productos USING hash (producto_id);

SELECT oid, datname FROM pg_database WHERE datname = current_database();

SELECT pg_relation_size('idx_hash_producto_id') AS tamanno_bytes;

SELECT relname, relfilenode, reltablespace, relpages, reltuples
FROM pg_class
WHERE relname = 'idx_hash_producto_id';

COMMIT;
