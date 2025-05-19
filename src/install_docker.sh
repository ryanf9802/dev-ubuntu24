#!/usr/bin/env bash

sudo apt install -y docker-compose

DOCKER_CONFIG="/usr/local/lib/docker"
sudo mkdir -p $DOCKER_CONFIG/cli-plugins

# Docker compose V2
sudo curl -SL https://github.com/docker/compose/releases/download/v2.36.0/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose

sudo chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

# Docker BuildX
sudo curl -sSL https://github.com/docker/buildx/releases/download/v0.23.0/buildx-v0.23.0.linux-amd64 -o $DOCKER_CONFIG/cli-plugins/docker-buildx

sudo chmod +x $DOCKER_CONFIG/cli-plugins/docker-buildx
