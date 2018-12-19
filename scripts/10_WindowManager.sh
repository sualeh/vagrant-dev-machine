#!/bin/bash

upgradeBase () {
  echo "Update base system"
  apt-get -y -q update
  apt-get -y -q upgrade
}

installVBGuest () {
  echo "Install build tools"
  apt-get install -y -q linux-headers-$(uname -r) build-essential dkms
  echo "Install VirtualBox guest additions"
  wget http://download.virtualbox.org/virtualbox/5.2.22/VBoxGuestAdditions_5.2.22.iso
  sudo mkdir /media/VBoxGuestAdditions
  sudo mount -o loop,ro VBoxGuestAdditions_5.2.22.iso /media/VBoxGuestAdditions
  sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
  rm VBoxGuestAdditions_5.2.22.iso
  sudo umount /media/VBoxGuestAdditions
  sudo rmdir /media/VBoxGuestAdditions

  apt-get install -y -q virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
}

installWindowManager () {
  echo "Install window manager"
  apt-get install -y -q ubuntu-desktop
  apt-get install -y -q xinit
  sed -i 's/allowed_users=.*$/allowed_users=anybody/' /etc/X11/Xwrapper.config
}

installOthers () {
  echo 'Install unzip, curl, expect'
  apt-get install -y -q curl stow unzip expect terminator
}

setupDefaults () {
  echo 'Setup defaults'
}


# -----

echo "START - Install base packages"

upgradeBase
installVBGuest
installOthers
installWindowManager
setupDefaults

echo "END - Install base packages"
