-- Table
CREATE TABLE dim_unit_peternakan (
  id INT8,
  id_lokasi INT8,
  nama_unit VARCHAR(100),
  alamat TEXT,
  longitude DOUBLE PRECISION,
  latitude DOUBLE PRECISION,
  PRIMARY KEY(id)
);

-- Seed
COPY dim_unit_peternakan
FROM '/seed/csv/dim_unit_peternakan.csv'
WITH (
  FORMAT 'csv',
  DELIMITER ';',
  HEADER TRUE
);