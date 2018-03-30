#!/bin/bash
source "/vagrant/scripts/common.sh"

function installJava {
  echo "Install Open JDK"
  apt-get install -y openjdk-8-jdk-headless
}

function setupEnvVars {
  echo "Creating Java environment variables"
  echo "Setting JAVA_HOME"
  JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")
  ln -s ${JAVA_HOME} /usr/local/java
}

funcs=(installJava setupEnvVars)

echo "Setup Java"

for func in "${funcs[@]}"
do
  $func || fail $func
done

echo "Java setup complete"
