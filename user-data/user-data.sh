#!/bin/bash

set -e

export GIT_REPO=https://github.com/marublaize/debian-nginx-demo.git
export DIRECTORY=debian-nginx-demo

sudo yum update -y
sudo yum install -y git

# Install Docker
sudo amazon-linux-extras install -y docker
sudo usermod -aG docker $USER

sudo systemctl enable docker.service
sudo systemctl start docker.service

# Install Compose
curl -fsSL -o docker-compose https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) 
sudo install docker-compose /usr/local/bin/

# Clone the repo
git clone $GIT_REPO $DIRECTORY

cd ./$DIRECTORY
sudo $(which docker-compose) up -d