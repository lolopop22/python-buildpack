#!/usr/bin/env bash
set -exuo pipefail

echo "------> Installing Rclone"
go get -v github.com/rclone/rclone

cd "$( dirname "${BASH_SOURCE[0]}" )/.."
source .envrc

GOOS=linux go build -mod=vendor -ldflags="-s -w" -o bin/supply ./src/python/supply/cli
GOOS=linux go build -mod=vendor -ldflags="-s -w" -o bin/finalize ./src/python/finalize/cli
