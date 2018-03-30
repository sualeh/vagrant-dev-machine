#!/bin/bash
FAIL_RC=2
SUCC_RC=0

# common functions
fail () {
  echo "$1 - failed!" 1>&2
  exit $FAIL_RC
}

resourceExists () {
  FILE=/vagrant/resources/$1
  if [ -e $FILE ]
  then
    return 0
  else
    return 1
  fi
}

fileExists () {
  FILE=$1
  if [ -e $FILE ]
  then
    return 0
  else
    return 1
  fi
}
