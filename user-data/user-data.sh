#!/bin/bash

sudo yum update
sudo yum install -y docker git

wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) 
sudo mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose
sudo chmod -v +x /usr/local/bin/docker-compose

sudo systemctl enable docker.service
sudo systemctl start docker.service

git clone git@github.com:marublaize/debian-nginx-demo.git

cd debian-nginx-demo
docker-compose up -d
