#!/usr/bin/env bash

# Stop and remove running containers
docker ps -q -a --filter="name=influxdb" | xargs docker rm -vf || true

# Build or force rebuild of the image postgres-storage
docker build -t influxdb:latest --no-cache=true .

docker run -p 8087:8086 \
	--name influxdb -d influxdb:latest \
	-config /etc/influxdb/influxdb.conf

# In order to bind existing data (ie: meta and data folder) in your container use the following in the run cmd
# -v {path-to-influxdb-folder}:/var/lib/influxdb -v {path-to-influxdb-folder}/influxdb.conf:/etc/influxdb/influxdb.conf:ro

# Wait before executing the init script
sleep 1

docker exec influxdb /docker-entrypoint.sh
