#!/bin/bash

BASENAME=$1

docker build -t base:$BASENAME .

./docker/extract-artifacts.sh base:$BASENAME

./docker/build-containers.sh core:$BASENAME local

sed -i -e "s/DHIS2_CORE_IMAGE=.*/DHIS2_CORE_IMAGE=core:$BASENAME/" docker-compose/cluster/.env

docker-compose -f docker-compose/cluster/docker-compose.yml up -d