#!/bin/bash
source "/vagrant/scripts/common.sh"

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

echo "Setup Ubuntu user"

chgPassword

echo "Ubuntu user setup complete"
