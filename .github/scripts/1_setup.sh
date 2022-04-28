#!/bin/bash

# install prereqs
sudo apt-get -y update
sudo apt-get -y install \
    software-properties-common \
    ca-certificates lsb-release gnupg curl git jq

# add terraform repos
curl -fsSL https://apt.releases.hashicorp.com/gpg \
    | sudo apt-key add -

sudo apt-add-repository \
    "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# add docker repos
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
    | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" \
    | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# install the stuff
sudo apt-get -y update
sudo apt-get -y install \
    docker-ce docker-ce-cli containerd.io terraform=1.1.6
