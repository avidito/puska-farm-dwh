FROM postgis/postgis:15-3.4

RUN apt-get update && \
    apt install gdal-bin -y

WORKDIR /src
COPY seed/ /seed
COPY src/ /src

COPY src/spatial.sh /src/spatial.sh
COPY src/init.sh /docker-entrypoint-initdb.d/
