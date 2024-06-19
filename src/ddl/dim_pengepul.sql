-- Table
CREATE TABLE dim_pengepul (
  id INT8,
  id_unit_peternakan INT8,
  nama_pengepul VARCHAR(100),
  jenis_pengepul VARCHAR(100),
  jenis_kelamin VARCHAR(10),
  tgl_lahir DATE,
  pendidikan VARCHAR(30),
  PRIMARY KEY(id)
);

-- Seed
COPY dim_pengepul
FROM '/seed/csv/dim_pengepul.csv'
WITH (
  FORMAT 'csv',
  DELIMITER ';',
  HEADER TRUE
);
