# Puska Farm - Data Warehouse

## Description
Puska Farm - Data Warehouse schema and instance definition. Based on **Postgres** database with **Galaxy Schema**. Deployed as containerized application. Data seeds are produced from **Puska Apps** database (only for dimensions and injected data). Seed are included as [query](./query/seed/) and as [CSV data](./src/seed/).

## Related Project
1. Puska Farm - ETL
2. Puska Farm - ML

## Relations
![ERD](./docs/ERD.png)

Table List
|Name|Type|Description|
|:--|:-:|:--|
|dim_jenis_produk|DIM|Referensi jenis produk peternakan|
|dim_lokasi|DIM|Referensi lokasi geografis|
|dim_pengepul|DIM|Referensi informasi pengepul hasil ternak|
|dim_peternakan|DIM|Referensi peternakan|
|dim_sumber_pasokan|DIM|Referensi sumber pemasok|
|dim_unit_peternak|DIM|Referensi lokasi peternakan (unit)|
|dim_waktu|DIM|Referensi waktu|
|fact_distribusi|FACT|Ringkasan distribusi hasil ternak harian per jenis produk|
|fact_populasi|FACT|Ringkasan populasi ternak harian per jenis ternak|
|fact_produksi|FACT|Ringkasan produksi hasil tenrak harian per jenis produk|
|log_stream|LOG|Riwayat dan metadata pemrosesan stream|
|log_batch|LOG|Riwayat dan metadata pemrosesan batch|


## Deployment
This project directly derived from Postgres image with extra process:
- Init tables
- Inject seed data

The initial configuration for services are the same with base Postgres image.

***NB: Make sure to not change /seed volumes to avoid any init phase errors**

To build new image, go to **src/** directory and run:
```sh
docker build -t puska-farm-dwh .
```

To deploy new services, run:

**Bash**
```sh
docker run \
    -e POSTGRES_PASSWORD=puska \
    -e POSTGRES_USER=puska \
    -e POSTGRES_DB=puska \
    --rm -d \
    --name puska-farm-dwh \
    -p 5601:5432 \
    puska-farm-dwh:latest
```

**Powershell**
```powershell
docker run `
    -e POSTGRES_PASSWORD=puska `
    -e POSTGRES_USER=puska `
    -e POSTGRES_DB=puska `
    --rm -d `
    --name puska-farm-dwh `
    -p 5601:5432 `
    puska-farm-dwh:latest
```

**Docker Compose**
```yml
version: "3"
services:
    db-dwh:
        build:
            context: ./puska-farm-dwh/src/postgres
        environment:
            - POSTGRES_PASSWORD=${DWH_DB_PASSWORD:-puska}
            - POSTGRES_USER=${DWH_DB_USER:-puska}
            - POSTGRES_DB=${DWH_DB_NAME:-puska}
        ports:
            - 5601:5432
```