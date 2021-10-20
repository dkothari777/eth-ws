#!/usr/bin/env bash

set -eu

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
BASE_WORKSPACE_DIRECTORY=$(dirname "${SCRIPT_DIR}")

if ! command -v docker &> /dev/null ; then
  echo "Error: Docker cli not found in PATH or docker is not installed!"
fi

echo "Building Bitcoin Postgres Environment Environment"
docker build "${BASE_WORKSPACE_DIRECTORY}"/docker -t bc-pg:latest

if [ $(docker ps --filter=name=bc-gp | wc -l) -eq 1 ]; then
  docker kill bc-pg;
  docker rm bc-pg;
fi

docker run --name bc-pg -e POSTGRES_PASSWORD=postgres -d bc-pg:latest
echo
echo "Waiting for postgres server to come up...."
sleep 30
docker exec bc-pg psql -U postgres -d postgres -f /pg_scripts/__V1__load_data.psql

echo "Successfully loaded data"
