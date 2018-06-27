#!/usr/bin/env bash
CURRENT_USER_ID=$(id -u)
#docker build -f ${PWD}/docker/docker-compose.yml -p test up -d
echo docker build -t prova/build --file ${PWD}/docker/Dockerfile --no-cache --build-arg CURRENT_UID=${CURRENT_USER_ID} .
docker build -t prova/build --file ${PWD}/docker/Dockerfile --no-cache --build-arg CURRENT_UID=${CURRENT_USER_ID} .
docker-compose -f ${PWD}/docker/docker-compose.yml up -d