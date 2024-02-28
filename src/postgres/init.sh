# Table
ls /ddl | while read query
do
  psql -U $POSTGRES_USER -d $POSTGRES_DB -f /ddl/$query -q
done

# Seed
psql -U $POSTGRES_USER -d $POSTGRES_DB -c "COPY dim_jenis_produk FROM '/seed/dim_jenis_produk.csv' WITH (FORMAT 'csv', DELIMITER ';', HEADER TRUE);"
psql -U $POSTGRES_USER -d $POSTGRES_DB -c "COPY dim_lokasi FROM '/seed/dim_lokasi.csv' WITH (FORMAT 'csv', DELIMITER ';', HEADER TRUE);"
psql -U $POSTGRES_USER -d $POSTGRES_DB -c "COPY dim_mitra_bisnis FROM '/seed/dim_mitra_bisnis.csv' WITH (FORMAT 'csv', DELIMITER ';', HEADER TRUE);"
psql -U $POSTGRES_USER -d $POSTGRES_DB -c "COPY dim_pengepul FROM '/seed/dim_pengepul.csv' WITH (FORMAT 'csv', DELIMITER ';', HEADER TRUE);"
psql -U $POSTGRES_USER -d $POSTGRES_DB -c "COPY dim_peternakan FROM '/seed/dim_peternakan.csv' WITH (FORMAT 'csv', DELIMITER ';', HEADER TRUE);"
psql -U $POSTGRES_USER -d $POSTGRES_DB -c "COPY dim_sumber_pasokan FROM '/seed/dim_sumber_pasokan.csv' WITH (FORMAT 'csv', DELIMITER ';', HEADER TRUE);"
psql -U $POSTGRES_USER -d $POSTGRES_DB -c "COPY dim_unit_peternak FROM '/seed/dim_unit_peternak.csv' WITH (FORMAT 'csv', DELIMITER ';', HEADER TRUE);"
psql -U $POSTGRES_USER -d $POSTGRES_DB -c "COPY dim_waktu FROM '/seed/dim_waktu.csv' WITH (FORMAT 'csv', DELIMITER ';', HEADER TRUE);"

psql -U $POSTGRES_USER -d $POSTGRES_DB -c "COPY fact_populasi FROM '/seed/populasi_kabupaten_kota.csv' WITH (FORMAT 'csv', DELIMITER ';', HEADER TRUE);"
psql -U $POSTGRES_USER -d $POSTGRES_DB -c "COPY fact_populasi FROM '/seed/populasi_kecamatan.csv' WITH (FORMAT 'csv', DELIMITER ';', HEADER TRUE);"
