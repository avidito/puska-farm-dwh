docker build -t puska-farm-dwh .
docker run --name puska-farm-dwh -p 5601:5432 --env-file .env -v puska-farm-dwh-volume:/var/lib/postgresql --restart always -d puska-farm-dwh