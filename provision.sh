#!/bin/bash

# Inspired by --> https://github.com/hnakamur/vagrant-ubuntu-docker-shell-provision-example/

# Installing docker for Debian7 by --> http://docs.docker.com/installation/debian/#debian-wheezystable-7x-64-bit
echo deb http://http.debian.net/debian wheezy-backports main | sudo tee /etc/apt/sources.list
sudo apt-get update
sudo apt-get install -t wheezy-backports linux-image-amd64
curl -sSL https://get.docker.com/ | sh

# Below refactored out to docker.sh
# Pull the latest docker images (should be tagged?)
sudo docker pull leowmjw/oa-ubuntu-trusty-db

# Turn on the MySQL DB (MySQL 5.5 on Ubuntu 14.04)
sudo docker run -d -i -t -p 3306:3306 leowmjw/oa-ubuntu-trusty-db /run.sh

# Pull the latest docker images (should be tagged?)
sudo docker pull leowmjw/oa-ubuntu-10.04-web

# Turn on the Apache server (Ubuntu 10.04)
docker run -d -i -t -p 80:80 leowmjw/oa-ubuntu-10.04-web /run.sh

# Future: Turn on the parser container

# Future: Turn on the Xapian container

