#!/bin/bash

repoUpdate () {
  echo "Install base Ubuntu packages"
  apt-get update -y -q
}

installVBGuest () {
  echo "Install VirtualBox guest additions"
  apt-get install -y -q virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
}

setupXfce4 () {
  echo "Install XFCE4"
  apt-get install -y -q xfce4 xdm xfce4-terminal
  echo "Remove xterm"
  apt-get remove -y -q xterm
	apt-get install -y -q eterm
  dpkg-reconfigure xdm
}

installOthers () {
  echo 'Install unzip, curl, expect'
  apt-get install -y -q curl unzip expect
}


# -----

echo "Install base packages"

repoUpdate 
installVBGuest 
setupXfce4 
installOthers

echo "Base packages install complete"
