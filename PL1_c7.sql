\c pl1
BEGIN;

DELETE FROM productos
WHERE producto_id IN (
    SELECT producto_id 
    FROM productos 
    ORDER BY random()
    LIMIT 4000000
);

SELECT pg_size_pretty(pg_relation_size('productos')) AS table_size, pg_relation_size('productos') / 8192 AS blocks_used;
COMMIT;

-- VACUUM FULL