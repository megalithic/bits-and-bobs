#!/bin/sh

# Docker
# https://docs.docker.com/machine/get-started/
docker-machine ls
docker-machine create --driver virtualbox dev
docker-machine ls
eval "$(docker-machine env dev)"
docker ps
