#!/bin/sh
./clean-azure.sh
docker-compose -f ../docker/docker-compose.base.yaml down --remove-orphans
PIPES_CONFIG=with-error MESSAGES_COUNT=500 COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose --project-directory ../docker -f ../docker/docker-compose.base.yaml -f ../docker/docker-compose.producer.yaml -f ../docker/docker-compose.worker.yaml -f ../docker/providers/azure-local/docker-compose.yaml up --remove-orphans --build --exit-code-from="worker"
./clean-azure.sh