#!/bin/bash

repoUpdate () {
  echo "Install base Ubuntu packages"
  apt-get update -y -q
}

installVBGuest () {
  echo "Install VirtualBox guest additions"
  apt-get install -y -q virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
}

installOthers () {
  echo 'Install unzip, curl, expect'
  apt-get install -y -q curl unzip expect
}

setupXFCE4 () {
  echo "Install XFCE4"
  apt-get install -y -q xfce4 xdm xfce4-terminal
  echo "Remove xterm"
  apt-get remove -y -q xterm
  sed -i 's/allowed_users=.*$/allowed_users=anybody/' /etc/X11/Xwrapper.config
  dpkg-reconfigure xdm
}

setupLXDE () {
  echo "Install LXDE"
  # apt-get -y -q install --no-install-recommends lubuntu-desktop
  sed -i 's/allowed_users=.*$/allowed_users=anybody/' /etc/X11/Xwrapper.config
	#apt-get install lxde
	#apt-get install xserver-xorg-video-all xserver-xorg
}

setupUbuntu () {
  echo "Install Ubuntu desktop"
  apt-get -y -q install --no-install-recommends ubuntu-desktop
  sed -i 's/allowed_users=.*$/allowed_users=anybody/' /etc/X11/Xwrapper.config
}

# -----

echo "Install base packages"

repoUpdate
installVBGuest
installOthers
setupXFCE4

echo "Base packages install complete"
