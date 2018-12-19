#!/bin/bash

installBuildTools () {
  echo 'Install Apache Maven'
  apt-get install -y -q maven

  echo 'Install Gradle'
  apt-get install -y -q gradle

  echo 'Install Travis'
  apt-get install -y -q ruby ruby-dev
  gem install travis
}

installOthers () {
  echo 'Install Firefox'
  apt-get install -y -q firefox
  echo 'Install git, Graphviz'
  apt-get install -y -q git graphviz
}


# -----

echo "START - Install additional packages"

installBuildTools 
installOthers

echo "END - Install additional packages"
