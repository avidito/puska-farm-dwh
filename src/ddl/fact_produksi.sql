-- Table: Batch
CREATE TABLE fact_produksi (
  id_waktu INT8,
  id_lokasi INT8,
  id_unit_peternakan INT8,
  id_jenis_produk INT8,
  id_sumber_pasokan INT8,
  jumlah_produksi NUMERIC,
  created_dt TIMESTAMP,
  modified_dt TIMESTAMP,
  PRIMARY KEY(id_waktu, id_lokasi, id_unit_peternakan, id_jenis_produk, id_sumber_pasokan)
);

-- Table: Stream
CREATE TABLE fact_produksi_stream (
  id_waktu INT8,
  id_lokasi INT8,
  id_unit_peternakan INT8,
  id_jenis_produk INT8,
  id_sumber_pasokan INT8,
  jumlah_produksi NUMERIC,
  created_dt TIMESTAMP,
  modified_dt TIMESTAMP,
  PRIMARY KEY(id_waktu, id_lokasi, id_unit_peternakan, id_jenis_produk, id_sumber_pasokan)
);
