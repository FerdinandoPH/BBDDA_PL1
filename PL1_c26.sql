\c pl1

-- BEGIN;

-- DROP TABLE IF EXISTS productos3;
-- DROP TABLE IF EXISTS productos3_0;
-- DROP TABLE IF EXISTS productos3_1;
-- DROP TABLE IF EXISTS productos3_2;
-- DROP TABLE IF EXISTS productos3_3;
-- DROP TABLE IF EXISTS productos3_4;
-- DROP TABLE IF EXISTS productos3_5;
-- DROP TABLE IF EXISTS productos3_6;
-- DROP TABLE IF EXISTS productos3_7;
-- DROP TABLE IF EXISTS productos3_8;
-- DROP TABLE IF EXISTS productos3_9;

-- CREATE TABLE productos3(
--     producto_id INTEGER,
--     nombre CHAR(20),
--     stock INTEGER,
--     precio INTEGER
-- ) PARTITION BY HASH(stock);

-- CREATE TABLE productos3_0 PARTITION OF productos3 FOR VALUES WITH (MODULUS 10, REMAINDER 0);
-- CREATE TABLE productos3_1 PARTITION OF productos3 FOR VALUES WITH (MODULUS 10, REMAINDER 1);
-- CREATE TABLE productos3_2 PARTITION OF productos3 FOR VALUES WITH (MODULUS 10, REMAINDER 2);
-- CREATE TABLE productos3_3 PARTITION OF productos3 FOR VALUES WITH (MODULUS 10, REMAINDER 3);
-- CREATE TABLE productos3_4 PARTITION OF productos3 FOR VALUES WITH (MODULUS 10, REMAINDER 4);
-- CREATE TABLE productos3_5 PARTITION OF productos3 FOR VALUES WITH (MODULUS 10, REMAINDER 5);
-- CREATE TABLE productos3_6 PARTITION OF productos3 FOR VALUES WITH (MODULUS 10, REMAINDER 6);
-- CREATE TABLE productos3_7 PARTITION OF productos3 FOR VALUES WITH (MODULUS 10, REMAINDER 7);
-- CREATE TABLE productos3_8 PARTITION OF productos3 FOR VALUES WITH (MODULUS 10, REMAINDER 8);
-- CREATE TABLE productos3_9 PARTITION OF productos3 FOR VALUES WITH (MODULUS 10, REMAINDER 9);

-- \copy productos3 FROM 'productos.csv' DELIMITER ',' CSV;

-- COMMIT;

BEGIN;

SELECT pg_stat_reset();
SET max_parallel_workers_per_gather = 0;
DISCARD PLANS;
\o salida.txt
EXPLAIN (ANALYZE, BUFFERS) SELECT * FROM productos3 WHERE stock = 200;
SELECT * FROM productos3 WHERE stock = 200;
\o
SHOW max_parallel_workers_per_gather;

COMMIT;
SELECT pg_sleep(1);
BEGIN;

SELECT relname, heap_blks_read, heap_blks_hit
FROM pg_statio_user_tables
WHERE heap_blks_read > 0;

SELECT *
FROM pg_statio_user_indexes;


COMMIT;