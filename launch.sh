#!/bin/bash

CONTAINER=$1

while true; do
  # Start the service in detached mode
  docker compose up --force-recreate -d $CONTAINER

  # Wait for the container to exit
  container_id=$(docker compose ps -q $CONTAINER)
  echo "Waiting for $CONTAINER..."
  docker wait "$container_id"

  echo "$CONTAINER exited. Recreating..."
  sleep 5
done
