#!/bin/bash

# Eclipse IDE
CURRENT_USER=vagrant
ECLIPSE_TARGET=/home/$CURRENT_USER/eclipse

installEclipse () {
  echo "Installing Eclipse IDE and plugins"
  awk 'BEGIN{RS="\r|\n|\r\n|\n\r";ORS="\n"}{print}' /vagrant/scripts/install-eclipse > /vagrant/scripts/install-eclipse.sh
  chmod +x /vagrant/scripts/install-eclipse.sh
  /vagrant/scripts/install-eclipse.sh -f -c /vagrant/scripts/install-eclipse.cfg ${ECLIPSE_TARGET}
	rm /vagrant/scripts/install-eclipse.sh
}

changeOwner () {
  echo "Changing owner of eclipse directories"
  chown -R -L ${CURRENT_USER}:${CURRENT_USER} ${ECLIPSE_TARGET}
  chown -R  ${CURRENT_USER}:${CURRENT_USER} ${ECLIPSE_TARGET}
}


# -----

echo "START - Setup Eclipse"

installEclipse
changeOwner

echo "END - Setup Eclipse"
