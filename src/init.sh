#!/bin/bash

# Initiate Table
ls /src/ddl | while read query
do
  psql -U ${POSTGRES_USER:-postgres} -d ${POSTGRES_DB:-postgres} -f /src/ddl/$query
done
