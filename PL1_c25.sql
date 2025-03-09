\c pl1

BEGIN;

SELECT pg_stat_reset();
SET max_parallel_workers_per_gather = 0;
DISCARD PLANS;
\o salida.txt
EXPLAIN (ANALYZE, BUFFERS) SELECT * FROM productos WHERE stock = 100 AND precio = 1000;
-- SELECT * FROM productos WHERE stock = 100 AND precio = 1000;
-- SELECT * FROM productos WHERE stock = 100 OR precio = 1000;
-- SELECT * FROM productos WHERE stock = 100;
SELECT * FROM productos WHERE precio = 1000;

\o
SHOW max_parallel_workers_per_gather;

COMMIT;
SELECT pg_sleep(1);
BEGIN;

SELECT relname, heap_blks_read, heap_blks_hit
FROM pg_statio_user_tables
WHERE relname = 'productos';

SELECT *
FROM pg_statio_user_indexes;


COMMIT;