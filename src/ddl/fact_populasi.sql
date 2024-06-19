-- Table: Batch
CREATE TABLE fact_populasi (
  id_waktu INT8,
  id_lokasi INT8,
  id_peternakan INT8,
  jenis_kelamin VARCHAR(10),
  tipe_ternak VARCHAR(15) NULL,
  tipe_usia VARCHAR(15) NULL,
  jumlah_lahir INT8,
  jumlah_mati INT8,
  jumlah_masuk INT8,
  jumlah_keluar INT8,
  jumlah INT8,
  created_dt TIMESTAMP,
  modified_dt TIMESTAMP,
  PRIMARY KEY(id_waktu, id_lokasi, id_peternakan, jenis_kelamin, tipe_ternak, tipe_usia)
);

-- Table: Stream
CREATE TABLE fact_populasi_stream (
  id_waktu INT8,
  id_lokasi INT8,
  id_peternakan INT8,
  jenis_kelamin VARCHAR(10),
  tipe_ternak VARCHAR(15),
  tipe_usia VARCHAR(15),
  jumlah_lahir INT8,
  jumlah_mati INT8,
  jumlah_masuk INT8,
  jumlah_keluar INT8,
  jumlah INT8,
  created_dt TIMESTAMP,
  modified_dt TIMESTAMP,
  PRIMARY KEY(id_waktu, id_lokasi, id_peternakan, jenis_kelamin, tipe_ternak, tipe_usia)
);

-- Seed (Kabkota)
COPY fact_populasi
FROM '/seed/csv-inject/populasi_kabupaten_kota.csv'
WITH (
  FORMAT 'csv',
  DELIMITER ';',
  HEADER TRUE
);

-- Seed (Kecamatan)
COPY fact_populasi
FROM '/seed/csv-inject/populasi_kecamatan.csv'
WITH (
  FORMAT 'csv',
  DELIMITER ';',
  HEADER TRUE
);
