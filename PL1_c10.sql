\c pl1
BEGIN;

CREATE TABLE productos3(
    producto_id INTEGER,
    nombre CHAR(20),
    stock INTEGER,
    precio INTEGER
) PARTITION BY RANGE(precio);

CREATE TABLE productos3_0 PARTITION OF productos3 FOR VALUES FROM (1) TO (501);
CREATE TABLE productos3_500 PARTITION OF productos3 FOR VALUES FROM (501) TO (1001);
CREATE TABLE productos3_1000 PARTITION OF productos3 FOR VALUES FROM (1001) TO (1501);
CREATE TABLE productos3_1500 PARTITION OF productos3 FOR VALUES FROM (1501) TO (2001);
CREATE TABLE productos3_2000 PARTITION OF productos3 FOR VALUES FROM (2001) TO (2501);
CREATE TABLE productos3_2500 PARTITION OF productos3 FOR VALUES FROM (2501) TO (3001);
CREATE TABLE productos3_3000 PARTITION OF productos3 FOR VALUES FROM (3001) TO (3501);
CREATE TABLE productos3_3500 PARTITION OF productos3 FOR VALUES FROM (3501) TO (4001);
CREATE TABLE productos3_4000 PARTITION OF productos3 FOR VALUES FROM (4001) TO (4501);
CREATE TABLE productos3_4500 PARTITION OF productos3 FOR VALUES FROM (4501) TO (5001);

INSERT INTO productos3(producto_id, nombre, stock, precio) SELECT * FROM productos;

DO $$
DECLARE
    i INTEGER := 0;
BEGIN
    -- Para cada partición, comprobar el tamaño con pg_relation_size y el número de bloques con pg_relation_size / 8192
    FOR i IN 0..4500 BY 500 LOOP
        RAISE NOTICE 'Tamaño de la tabla productos3_%: %', i, pg_size_pretty(pg_relation_size('productos3_' || i));
        RAISE NOTICE 'Número de bloques de la tabla productos3_%: %', i, pg_relation_size('productos3_' || i) / 8192;
    END LOOP;
END $$;

COMMIT;
