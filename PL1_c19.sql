\c pl1

BEGIN;

CREATE INDEX IF NOT EXISTS idx_hash_precio ON productos USING hash (precio);
COMMIT;

BEGIN;
SELECT oid, datname FROM pg_database WHERE datname = current_database();

SELECT pg_size_pretty(pg_relation_size('idx_hash_precio')) AS tamanno_bytes, pg_relation_size('idx_hash_precio')/8192 AS blocks_used;

SELECT relname, relfilenode, reltablespace, relpages, reltuples
FROM pg_class
WHERE relname = 'idx_hash_precio';

CREATE EXTENSION IF NOT EXISTS pageinspect;

SELECT ntuples, maxbucket FROM hash_metapage_info(get_raw_page('idx_hash_precio',0));
COMMIT;

