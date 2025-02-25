\c pl1

BEGIN;

SELECT pg_stat_reset();
SET max_parallel_workers_per_gather = 0;
DISCARD PLANS;
\o salida.txt
EXPLAIN (ANALYZE, BUFFERS) SELECT * FROM productos WHERE precio = 2000;
SELECT * FROM productos WHERE precio = 2000;
\o
SHOW max_parallel_workers_per_gather;

COMMIT;
SELECT pg_sleep(1);
BEGIN;
SELECT blks_read, blks_hit
FROM pg_stat_database
WHERE datname = current_database();

SELECT *
FROM pg_statio_user_indexes;


COMMIT;