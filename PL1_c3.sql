\c pl1

BEGIN;

SELECT * FROM pg_stat_reset();
SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit
FROM pg_statio_user_tables
WHERE relname = 'productos';

SELECT COUNT(*) FROM productos WHERE precio = 3000;
COMMIT;

BEGIN;

SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit
FROM pg_statio_user_tables
WHERE relname = 'productos';

COMMIT;