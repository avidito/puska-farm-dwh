-- Table
CREATE TABLE dim_lokasi (
  id INT8,
  provinsi VARCHAR(100),
  kabupaten_kota VARCHAR(100),
  kecamatan VARCHAR(100),
  region GEOMETRY,
  PRIMARY KEY(id)
);

-- Seed
COPY dim_lokasi
FROM '/seed/csv/dim_lokasi.csv'
WITH (
  FORMAT 'csv',
  DELIMITER ';',
  HEADER TRUE
);