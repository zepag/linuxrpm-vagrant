#!/usr/bin/bash

# Install latest docker binary
echo "Install docker"
curl -s -L http://get.docker.io/builds/Linux/x86_64/docker-latest.tgz > /tmp/docker-latest.tgz
tar xzf /tmp/docker-latest.tgz -C /

# Install docker service
# Download the required files from https://github.com/docker/docker/tree/master/contrib/init/systemd to your Vagrant directory

echo "Install docker as a service"
SERVICE_DIR="/etc/systemd/system"
cp /vagrant/docker.service $SERVICE_DIR
cp /vagrant/docker.socket $SERVICE_DIR
systemctl enable docker.service
systemctl start docker.service

echo "Allow vagrant user to run docker commands"
groupadd docker
chown root:docker /var/run/docker.sock
usermod -a -G docker vagrant

# Install docker compose
#rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
#yum update -y
#yum install python-pip -y
#pip install -U docker-compose
# 
# To speed up things
# Specific to 1.1.0 TODO: change to latest if necessary! (2015-03-10)
echo "Install docker compose"
curl -s -L https://github.com/docker/compose/releases/download/1.1.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


# Install docker compose bash completion
echo "Install docker and docker compose bash completion files"
curl -s -L https://raw.githubusercontent.com/docker/compose/1.1.0/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose

# Install docker bash completion
curl -s -L https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker > /etc/bash_completion.d/docker

# Install bash completion and git
echo "Install git and bash-completion"
yum -y -q install git bash-completion

echo "All done ;)"
