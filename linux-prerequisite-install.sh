#!/bin/bash

if ! hash ansible >/dev/null 2>&1; then
    echo "### Installing Ansible..."
    sudo apt-get update
    sudo apt-get install software-properties-common ansible git python-apt -y
else
    echo "### Ansible already installed ###"
fi

if ! hash git >/dev/null 2>&1; then
    echo "### Installing git..."
    sudo apt-get install -y git
    ssh-keygen -q -t rsa -N '' -b 4096 -f ~/.ssh/id_rsa <<<y 2>&1 >/dev/null
else
    echo "### Git already installed ###"
fi

if ! hash docker >/dev/null 2>&1; then
    echo "### Installing docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo groupadd docker
    sudo usermod -aG docker $USER
else
    echo "### Docker already installed ###"
fi

if ! hash docker-compose >/dev/null 2>&1; then
    echo "### Installing docker-compose..."
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
else
    echo "### docker-compose already installed ###"
fi