-- Table
CREATE TABLE dim_jenis_produk (
  id INT8,
  nama_produk VARCHAR(100),
  kategori_produk VARCHAR(100),
  satuan VARCHAR(100),
  PRIMARY KEY (id)
);

-- Seed
COPY dim_jenis_produk
FROM '/seed/csv/dim_jenis_produk.csv'
WITH (
  FORMAT 'csv',
  DELIMITER ';',
  HEADER TRUE
);