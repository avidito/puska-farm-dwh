-- Table
CREATE TABLE dim_peternakan (
  id INT8,
  id_unit_peternakan INT8,
  nama_peternakan VARCHAR(100),
  nama_pemilik VARCHAR(100),
  jenis_kelamin VARCHAR(10),
  tgl_lahir DATE,
  pendidikan VARCHAR(30),
  PRIMARY KEY(id)
);

COPY dim_peternakan
FROM '/seed/csv/dim_peternakan.csv'
WITH (
  FORMAT 'csv',
  DELIMITER ';',
  HEADER TRUE
);