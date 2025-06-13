#!/bin/bash

function looper () {
  REPO=$1

  while true; do
    # Start the service in detached mode
    docker compose up --force-recreate -d $REPO

    # Wait for the container to exit
    container_id=$(docker compose ps -q $REPO)
    echo "Waiting for $REPO container..."
    docker wait "$container_id"

    echo "Container exited. Recreating..."
    sleep 5
  done
}

for service in $(docker compose config --services); do
  looper "$service" &
done

wait
