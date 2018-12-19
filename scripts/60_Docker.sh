#!/bin/bash

# https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository

useRepositoryOverHTTPS () {
  echo 'Install packages to allow apt to use a repository over HTTPS' 
  apt-get install -y -q \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common
}

addDockerGPGKey () {
  echo 'Add Docker’s official GPG key for Ubuntu'
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
}

setupStableRepository () {
  echo 'Setup the stable repository for Ubuntu'
  add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"   
  echo 'Update'
  apt-get update
  apt-cache policy docker-ce
}

installDocker () {
  echo 'Install Docker CE'
  apt-get -y -q install docker-ce
  usermod -aG docker vagrant
}


# -----

echo "START - Setup Docker"

useRepositoryOverHTTPS 
addDockerGPGKey 
setupStableRepository 
installDocker

echo "END - Setup Docker"
