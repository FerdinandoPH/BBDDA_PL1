\c pl1
BEGIN;



CREATE INDEX IF NOT EXISTS idx_tree_producto_id ON productos(producto_id);

SELECT oid, datname FROM pg_database WHERE datname = current_database();

SELECT pg_relation_size('idx_tree_producto_id') AS tamanno_bytes;

SELECT relname, relfilenode, reltablespace, relpages, reltuples 
FROM pg_class
WHERE relname = 'idx_tree_producto_id';

CREATE EXTENSION IF NOT EXISTS pageinspect;

SELECT * FROM bt_metap('idx_tree_producto_id');

SELECT COUNT(blkno), btpo_level FROM bt_multi_page_stats('idx_tree_producto_id', 1,-1) GROUP BY btpo_level;

SELECT COUNT(*), btpo_level, live_items FROM bt_multi_page_stats('idx_tree_producto_id', 1,-1) GROUP BY btpo_level, live_items;
COMMIT;