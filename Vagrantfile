Vagrant.configure("2") do |config|

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/bionic64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = false
  config.vm.define :devbox do |t|
  end

  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
      vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
      vb.memory = "4096"
  end

  # Provision with shell scripts
  config.vm.network :private_network, ip: '10.211.55.102'
  config.vm.hostname = "devbox"
  config.vm.provision "shell", path: "scripts/10_WindowManager.sh"
  config.vm.provision "shell", path: "scripts/20_SetPassword.sh"
  config.vm.provision "shell", path: "scripts/30_Java.sh"
  config.vm.provision "shell", path: "scripts/40_Eclipse.sh"
  config.vm.provision "shell", path: "scripts/50_AdditionalPackages.sh"
  config.vm.provision "shell", path: "scripts/60_Docker.sh"

end
