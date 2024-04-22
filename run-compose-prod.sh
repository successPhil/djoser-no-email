#!/bin/sh

# The Dockerhub account where the images are stored
export DOCKERHUB_UNAME=successphil
export SECRET_KEY=abc123
export DEBUG=True
export POSTGRES_DB=pokemon_jwt_db
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
export NEW_VERSION=$NEW_VERSION


docker-compose -f docker-compose.prod.yml build --no-cache
docker-compose -f docker-compose.prod.yml up -d

# make sure the postgres container is ready, then run migrations
sleep 10 
docker exec djoser-no-email-api-1 python /src/manage.py makemigrations 
docker exec djoser-no-email-api-1 python /src/manage.py migrate