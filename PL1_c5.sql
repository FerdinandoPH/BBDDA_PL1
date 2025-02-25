\c pl1
BEGIN;
DROP TABLE IF EXISTS productos2;

CREATE TABLE productos2(
    producto_id INTEGER PRIMARY KEY,
    nombre CHAR(20),
    stock INTEGER,
    precio INTEGER
);

INSERT INTO productos2(producto_id, nombre, stock, precio) SELECT * FROM productos ORDER BY precio;
SELECT pg_size_pretty(pg_relation_size('productos2')) AS table_size, pg_relation_size('productos2') / 8192 AS blocks_used;

COMMIT;
\q