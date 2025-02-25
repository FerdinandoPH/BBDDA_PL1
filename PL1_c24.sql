\c pl1
DROP INDEX IF EXISTS idx_hash_producto_id;
DROP INDEX IF EXISTS idx_tree_precio;
DROP INDEX IF EXISTS idx_hash_precio;

BEGIN;

CREATE INDEX IF NOT EXISTS idx_multi ON productos(producto_id, precio);

COMMIT;