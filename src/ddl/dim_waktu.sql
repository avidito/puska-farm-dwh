-- Table
CREATE TABLE dim_waktu (
  id INT8,
  tanggal DATE,
  tahun INT8,
  bulan INT8,
  hari INT8,
  PRIMARY KEY(id)
);

-- Seed
COPY dim_waktu
FROM '/seed/csv/dim_waktu.csv'
WITH (
  FORMAT 'csv',
  DELIMITER ';',
  HEADER TRUE
);