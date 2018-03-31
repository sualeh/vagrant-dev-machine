#!/bin/bash

function chgPassword {
  echo "Change password of Ubuntu user"
  apt-get -qq install expect
  tee ~/chgPasswd.sh << EOF
  set timeout 20
  spawn sudo passwd ubuntu
  expect "Enter new UNIX password:" {send "ubuntu\\r"}
  expect "Retype new UNIX password:" {send "ubuntu\\r"}
  interact
EOF
  expect ~/chgPasswd.sh
  echo "Finished Ubuntu user setup"
}

function restartXDM {
  dpkg-reconfigure xdm
  systemctl restart xdm.service
}
	
# -----

echo "Setup Ubuntu user"

chgPassword
restartXDM

echo "Ubuntu user setup complete"
