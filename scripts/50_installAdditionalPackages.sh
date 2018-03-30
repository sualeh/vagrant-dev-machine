#!/bin/bash
source "/vagrant/scripts/common.sh"

installBuildTools () {
	echo 'Install Apache Maven'
	apt-get install -y -q maven

	echo 'Install Gradle'
	apt-get install -y -q gradle

	echo 'Install Travis'
	apt-get install -y -q ruby ruby-dev
	gem install travis
}

installOthers () {
  echo 'Install Chromium'
  apt-get install -y -q chromium-browser
  echo 'Install git, Graphviz'
  apt-get install -y -q git graphviz
}

funcs=(installBuildTools installOthers)

echo "Install additional packages"

for func in "${funcs[@]}"
do
  $func || fail $func
done

echo "Additional install packages complete"