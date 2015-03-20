#!/usr/bin/bash

# Install latest docker binary
cd /tmp
wget -c http://get.docker.io/builds/Linux/x86_64/docker-latest.tgz
tar xzf /tmp/docker-latest.tgz -C /

# Install docker service
# Download the required files from https://github.com/docker/docker/tree/master/contrib/init/systemd to your Vagrant directory

SERVICE_DIR="/etc/systemd/system"
cp /vagrant/docker.service $SERVICE_DIR
cp /vagrant/docker.socket $SERVICE_DIR
systemctl enable docker.service
systemctl start docker.service

groupadd docker
chown root:docker /var/run/docker.sock
usermod -a -G docker vagrant

# Install docker compose
rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
yum update -y
yum install python-pip -y
pip install -U docker-compose
