CREATE TABLE log_stream (
  table_name VARCHAR(100),
  source_table VARCHAR(100),
  action VARCHAR(100),
  old_data JSON,
  new_data JSON,
  start_tm TIMESTAMP,
  end_tm TIMESTAMP,
  duration FLOAT,
  created_dt TIMESTAMP,
  modified_dt TIMESTAMP
);