Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/xenial64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = false
  config.vm.define :playdev do |t|
  end

  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
      vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
      vb.memory = "4096"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.network :private_network, ip: '10.211.55.102'
  config.vm.hostname = "playdev"
  config.vm.provision "shell", path: "scripts/10_WindowManager.sh"
  config.vm.provision "shell", path: "scripts/20_SetPassword.sh"
  config.vm.provision "shell", path: "scripts/30_Java.sh"
  config.vm.provision "shell", path: "scripts/40_Eclipse.sh"
  config.vm.provision "shell", path: "scripts/50_AdditionalPackages.sh"
  config.vm.provision "shell", path: "scripts/60_Docker.sh"

end
