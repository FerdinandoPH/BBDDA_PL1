\c pl1

BEGIN;

SELECT pg_stat_reset();
SET max_parallel_workers_per_gather = 0; -- Desactivar paralelismo para asegurarse que las medidas de estadísticas sean consistentes
DISCARD PLANS;


\o salida.txt
SELECT * FROM productos WHERE precio = 2000;
\o

COMMIT;
SELECT pg_sleep(1); -- A veces, no nos salía información en las tablas de estadísticas sin una espera
BEGIN;

SELECT relname, heap_blks_read, heap_blks_hit
FROM pg_statio_user_tables
WHERE relname = 'productos';

SELECT indexrelname, idx_blks_read, idx_blks_hit
FROM pg_statio_user_indexes;
COMMIT;





BEGIN;
SELECT pg_stat_reset();
\o salida.txt
SELECT * FROM productos WHERE producto_id = 6000;
\o


COMMIT;
SELECT pg_sleep(1);
BEGIN;

SELECT relname, heap_blks_read, heap_blks_hit
FROM pg_statio_user_tables
WHERE relname = 'productos';

SELECT indexrelname, idx_blks_read, idx_blks_hit
FROM pg_statio_user_indexes;
COMMIT;





BEGIN;
SELECT pg_stat_reset();
\o salida.txt
SELECT * FROM productos WHERE producto_id BETWEEN 180000 AND 200000;
\o


COMMIT;
SELECT pg_sleep(1);
BEGIN;

SELECT relname, heap_blks_read, heap_blks_hit
FROM pg_statio_user_tables
WHERE relname = 'productos';

SELECT indexrelname, idx_blks_read, idx_blks_hit
FROM pg_statio_user_indexes;
COMMIT;





BEGIN;
SELECT pg_stat_reset();
\o salida.txt
SELECT * FROM productos WHERE precio > 4000;
\o


COMMIT;
SELECT pg_sleep(1);
BEGIN;

SELECT relname, heap_blks_read, heap_blks_hit
FROM pg_statio_user_tables
WHERE relname = 'productos';

SELECT indexrelname, idx_blks_read, idx_blks_hit
FROM pg_statio_user_indexes;
COMMIT;





BEGIN;
SELECT pg_stat_reset();
\o salida.txt
SELECT precio, COUNT(stock) FROM productos GROUP BY precio ORDER BY precio;
\o


COMMIT;
SELECT pg_sleep(1);
BEGIN;

SELECT relname, heap_blks_read, heap_blks_hit
FROM pg_statio_user_tables
WHERE relname = 'productos';

SELECT indexrelname, idx_blks_read, idx_blks_hit
FROM pg_statio_user_indexes;
COMMIT;





BEGIN;
SELECT pg_stat_reset();
\o salida.txt
SELECT precio, COUNT(stock) FROM productos GROUP BY precio ORDER BY precio;
\o


COMMIT;
SELECT pg_sleep(1);
BEGIN;

SELECT relname, heap_blks_read, heap_blks_hit
FROM pg_statio_user_tables
WHERE relname = 'productos';

SELECT indexrelname, idx_blks_read, idx_blks_hit
FROM pg_statio_user_indexes;
COMMIT;





BEGIN;
SELECT pg_stat_reset();
\o salida.txt
INSERT INTO productos(producto_id, nombre, stock, precio) VALUES(25000001, 'prod_25000001', 100, 1000);
\o


COMMIT;
SELECT pg_sleep(1);
BEGIN;

SELECT relname, heap_blks_read, heap_blks_hit
FROM pg_statio_user_tables
WHERE relname = 'productos';

SELECT indexrelname, idx_blks_read, idx_blks_hit
FROM pg_statio_user_indexes;
COMMIT;






BEGIN;
SELECT pg_stat_reset();
\o salida.txt
UPDATE productos SET precio = 2000 WHERE producto_id = 25000001;
\o


COMMIT;
SELECT pg_sleep(1);
BEGIN;

SELECT relname, heap_blks_read, heap_blks_hit
FROM pg_statio_user_tables
WHERE relname = 'productos';

SELECT indexrelname, idx_blks_read, idx_blks_hit
FROM pg_statio_user_indexes;
COMMIT;