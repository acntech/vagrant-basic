# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # Name of Vagrant Box
  config.vm.box = "acntech/xubuntu"

  # Don't generate new SSH key, but use the default insecure key
  config.ssh.insert_key = false

  # Set VM MAC address
  #config.vm.base_mac = "0800274EEC32"

  # VirtualBox provider
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true

    # Customize the amount of memory on the VM
    vb.memory = "1024"

    # Customize CPU count
    vb.cpus = "1"

    # Name to display in Virtualbox
    vb.name = "AcnTech Xubuntu"
  end

end
