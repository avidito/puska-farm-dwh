#!/bin/bash

# Load Geom Data
ls /seed/geom | grep '.gpkg' | while read geom_file
do
  echo "Loading $geom_file"
  ogr2ogr -f "PostgreSQL" PG:"dbname=${POSTGRES_DB:-postgres} user=${POSTGRES_USER:-postgres}" /seed/geom/$geom_file
done

# Run Process Query
echo "Running Process Query"
PRC_GEOM=prc_dim_lokasi_geom.sql
psql -U ${POSTGRES_USER:-postgres} -d ${POSTGRES_DB:-postgres} -f /src/query/$PRC_GEOM

echo "Finish"