\c pl1
DROP INDEX IF EXISTS idx_tree_producto_id;
DROP INDEX IF EXISTS idx_hash_producto_id;
DROP INDEX IF EXISTS idx_hash_precio;
DROP INDEX IF EXISTS idx_tree_precio;
DROP TABLE IF EXISTS productos;
BEGIN;

CREATE TABLE productos(
    producto_id INTEGER PRIMARY KEY,
    nombre CHAR(20),
    stock INTEGER,
    precio INTEGER
);

\copy productos FROM 'productos.csv' DELIMITER ',' CSV;

CREATE INDEX IF NOT EXISTS idx_hash_producto_id ON productos USING hash (producto_id);
CREATE INDEX IF NOT EXISTS idx_tree_precio ON productos(precio);

COMMIT;
