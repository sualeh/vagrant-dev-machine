#!/bin/bash

repoUpdate () {
  echo "Add contrib repo"
  echo "deb http://ftp.debian.org/debian stretch-backports main contrib" >> /etc/apt/sources.list
  echo "Update"
  apt-get update -y -q
}

installVBGuest () {
  echo "Install VirtualBox guest additions"
  apt-get install -y -q virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
}

setupXFCE4 () {
  echo "Install XFCE4"
  apt-get install -y -q xfce4 terminator
  cat ${XFCE4_PROFILE} >> /home/${USER}/.bashrc_local
}

installOthers () {
  echo 'Install unzip, curl, expect'
  apt-get install -y -q curl stow unzip expect
}

setupDefaults () {
  echo 'Setup defaults'
}


# -----

echo "Install base packages"

repoUpdate
installVBGuest
installOthers
setupXFCE4
setupDefaults

echo "Base packages install complete"
