FROM postgres:15.3

COPY src/ddl/ /ddl
COPY src/seed/ /seed
COPY src/init.sh /docker-entrypoint-initdb.d/
