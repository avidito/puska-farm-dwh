CREATE TABLE pred_susu (
  id SERIAL,
  id_waktu INTEGER,
  id_lokasi INTEGER,
  id_unit_peternakan INTEGER,
  prediction NUMERIC(20, 3),
  latency NUMERIC(20, 10),
  mape NUMERIC(20, 10),
  created_at TIMESTAMP,
  PRIMARY KEY (id)
);