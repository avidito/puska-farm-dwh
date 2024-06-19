CREATE TABLE log_batch (
  table_name VARCHAR(100),
  params TEXT,
  processed_rows INTEGER,
  start_tm TIMESTAMP,
  end_tm TIMESTAMP,
  duration FLOAT,
  created_dt TIMESTAMP,
  modified_dt TIMESTAMP
);