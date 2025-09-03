CREATE DATABASE IF NOT EXISTS Market;
USE Market;

CREATE TABLE IF NOT EXISTS products (
  id INT(12) PRIMARY KEY,
  name VARCHAR(255),
  code VARCHAR(255)
);

INSERT INTO products (id, name, code) VALUES
(1, 'Laptop Lenovo', 'LP001'),
(2, 'Mouse Logitech', 'MS002'),
(3, 'Teclado Redragon', 'KB003'),
(4, 'Monitor LG', 'MN004');
