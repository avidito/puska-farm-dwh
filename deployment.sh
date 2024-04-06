docker stop puska-farm-dwh
docker rm puska-farm-dwh
docker run --name puska-farm-dwh -p 5601:5432 --env-file .env -d puska-farm-dwh:$1