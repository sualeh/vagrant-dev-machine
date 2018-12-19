#!/bin/bash

function installJava {
  echo "Install Open JDK"
  apt-get install -y -q openjdk-8-jdk-headless
}

function setupEnvVars {
  echo "Creating Java environment variables"
  echo "Setting JAVA_HOME"
  JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")
  ln -s ${JAVA_HOME} /usr/local/java
}


# -----

echo "START - Setup Java"

installJava 
setupEnvVars

echo "END - Setup Java"
