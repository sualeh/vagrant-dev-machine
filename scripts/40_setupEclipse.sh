#!/bin/bash
source "/vagrant/scripts/common.sh"

# Eclipse IDE
ECLIPSE_TARGET=/home/ubuntu/eclipse

installEclipse () {
  echo "Installing Eclipse IDE and plugins"
	awk 'BEGIN{RS="^$";ORS="";getline;gsub("\r","");print>ARGV[1]}' /vagrant/scripts/install-eclipse.sh
  /vagrant/scripts/install-eclipse.sh -f -c /vagrant/scripts/install-eclipse.cfg ${ECLIPSE_TARGET}
}

changeOwner () {
  echo "Changing owner of Eclipse directories"
  chown -R -L ubuntu:ubuntu ${ECLIPSE_TARGET}
  chown -R  ubuntu:ubuntu ${ECLIPSE_TARGET}
}

funcs=(installEclipse changeOwner)

echo "Setup Eclipse"

for func in "${funcs[@]}"
do
  $func || fail $func
done

echo "Eclipse setup complete"
