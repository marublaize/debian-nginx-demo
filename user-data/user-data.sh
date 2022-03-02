#!/bin/bash

set -e

export DIRECTORY=debian-nginx-demo

sudo yum update -y
sudo yum install -y git

# Install Docker
curl -fsSL -o get-docker.sh https://get.docker.com
sudo sh get-docker.sh
sudo usermod -aG docker $USER

sudo systemctl enable docker.service
sudo systemctl start docker.service

# Install Compose
curl -fsSL -o docker-compose https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) 
sudo install docker-compose /usr/local/bin/

# Clone the repo
if [[ -d "$DIRECTORY" ]]
then
    rm -rf "$DIRECTORY"
fi

git clone https://github.com/marublaize/debian-nginx-demo.git

cd debian-nginx-demo
sudo docker-compose up -d
