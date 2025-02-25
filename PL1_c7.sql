\c pl1
BEGIN;

DELETE FROM productos
WHERE producto_id IN (
    SELECT producto_id 
    FROM productos 
    ORDER BY random()
    LIMIT 4000000
);
COMMIT;