CREATE TABLE pred_susu (
  id SERIAL,
  id_waktu INTEGER,
  id_lokasi INTEGER,
  id_unit_peternakan INTEGER,
  prediction NUMERIC(10, 3),
  latency NUMERIC(10, 10),
  mape NUMERIC(10, 10),
  created_at TIMESTAMP,
  PRIMARY KEY (id)
);