#!/bin/bash

PID_FILE="/tmp/runner.pid"

if [[ ! -f "$PID_FILE" ]]; then
  echo "PID file not found!"
  exit 1
fi

BASH_PID=$(cat "$PID_FILE")

nohup bash -c "sleep 5; kill -TERM $BASH_PID" >/dev/null 2>&1 &