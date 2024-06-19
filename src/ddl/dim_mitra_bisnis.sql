-- Table
CREATE TABLE dim_mitra_bisnis (
  id INT8,
  id_unit_peternakan INT8,
  nama_mitra_bisnis VARCHAR(100),
  kategori_mitra_bisnis VARCHAR(100),
  PRIMARY KEY(id)
);

-- Seed
COPY dim_mitra_bisnis
FROM '/seed/csv/dim_mitra_bisnis.csv'
WITH (
  FORMAT 'csv',
  DELIMITER ';',
  HEADER TRUE
);