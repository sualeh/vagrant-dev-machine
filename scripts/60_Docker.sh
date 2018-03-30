#!/bin/bash

# https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository

useRepositoryOverHTTPS () {
  echo 'Install packages to allow apt to use a repository over HTTPS'
  apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
}

addDockerGPGKey () {
  echo 'Add Docker’s official GPG key'
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
}

setupStableRepository () {
  echo 'Setup the stable repository'
  add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
  echo 'Update'
  apt-get update
}

installDocker () {
  echo 'Install Docker CE'
  apt-get -y -q install docker-ce
}


# -----

echo "Setup Docker"

useRepositoryOverHTTPS 
addDockerGPGKey 
setupStableRepository 
installDocker

echo "Docker setup complete"
