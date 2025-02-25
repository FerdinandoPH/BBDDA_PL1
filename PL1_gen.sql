\c postgres

DROP DATABASE IF EXISTS PL1;
CREATE DATABASE PL1;
\c pl1
BEGIN;
CREATE TABLE productos(
    producto_id INTEGER PRIMARY KEY,
    nombre CHAR(20),
    stock INTEGER,
    precio INTEGER
);
\copy productos FROM 'productos.csv' DELIMITER ',' CSV;

\q