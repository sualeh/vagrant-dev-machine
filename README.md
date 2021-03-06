# Vagrant Development Machine

> Forked from [martinprobson/vagrant-dev-machine](https://github.com/martinprobson/vagrant-dev-machine)

## Introduction

This is a Vagrant project to build and spin up a virtual machine with the following:

* Debian
* Java 8 (OpenJDK)
* XFCE4 desktop
* Eclipse Oxygen
* Docker CE
* Build Tools
  - Apache Maven
  - Gradle
  - Travis 
* Firefox (Iceweasel)

## Getting Started

1. [Download and install VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. [Download and install Vagrant](http://www.vagrantup.com/downloads.html).
3. Clone this project.
5. In your terminal change your directory into the project directory (i.e. `cd vagrant-dev-machine` )
6. Run ```vagrant up``` to create the virtual machine.
7. Execute ```vagrant ssh``` to login to the virtual machine or login to XFCE via VirtualBox.

 **NOTE** This virtual machine will take a significant time to provision initially whilst it downloads and builds the packages required.

## User

The user id of the VM is `vagrant` with a password of `vagrant`.

## Shared Folder

Vagrant automatically mounts the folder containing the Vagrant file from the host machine into
the guest machine as `/vagrant` inside the guest.


## Managment of Vagrant Virtual Machine

To stop the virtual machine and preserve all setup/ data within the virtual machine:

```
vagrant halt
```

or

```
vagrant suspend
```

Issue a `vagrant up` command again to restart the VM from where you left off.

To completely **wipe** the VM so that `vagrant up` command gives you a fresh machine: -

```
vagrant destroy -f
```

Then issue `vagrant up` command as usual.

## Known Issues/ To Do

1. Running `vagrant provision` multiple times can cause issues - need to fix.


## Credits

* Thanks to [Martin Robson](https://github.com/martinprobson) for the original [Vagrant virtual machine](https://github.com/martinprobson/vagrant-dev-machine).
* Thanks to [Budhaditya](https://github.com/budhash) for the [silent eclipse](https://github.com/budhash/install-eclipse) install script.
