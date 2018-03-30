#!/bin/bash

# Eclipse IDE
ECLIPSE_TARGET=/home/ubuntu/eclipse

installEclipse () {
  echo "Installing Eclipse IDE and plugins"
	awk 'BEGIN{RS="\r|\n|\r\n|\n\r";ORS="\n"}{print}' /vagrant/scripts/install-eclipse > /vagrant/scripts/install-eclipse.sh
	chmod +x /vagrant/scripts/install-eclipse.sh
  /vagrant/scripts/install-eclipse.sh -f -c /vagrant/scripts/install-eclipse.cfg ${ECLIPSE_TARGET}
}

changeOwner () {
  echo "Changing owner of Eclipse directories"
  chown -R -L ubuntu:ubuntu ${ECLIPSE_TARGET}
  chown -R  ubuntu:ubuntu ${ECLIPSE_TARGET}
}

echo "Setup Eclipse"

installEclipse 
changeOwner

echo "Eclipse setup complete"
