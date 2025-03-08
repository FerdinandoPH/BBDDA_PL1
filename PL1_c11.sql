\c pl1

BEGIN;

SELECT * FROM pg_stat_reset();
SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit
FROM pg_statio_user_tables
WHERE relname LIKE 'productos3%';

SELECT COUNT(*) FROM productos3 WHERE precio = 3000;
COMMIT;

BEGIN;

SELECT relname, heap_blks_read, heap_blks_hit, idx_blks_read, idx_blks_hit
FROM pg_statio_user_tables
WHERE relname LIKE 'productos3%';

COMMIT;