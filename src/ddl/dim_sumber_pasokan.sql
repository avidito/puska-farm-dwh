-- Table
CREATE TABLE dim_sumber_pasokan (
  id INT8,
  nama_sumber_pasokan VARCHAR(100),
  PRIMARY KEY(id)
);

COPY dim_sumber_pasokan
FROM '/seed/csv/dim_sumber_pasokan.csv'
WITH (
  FORMAT 'csv',
  DELIMITER ';',
  HEADER TRUE
);