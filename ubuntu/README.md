# AcnTech Ubuntu
AcnTech Ubuntu box based on Ubuntu Desktop 21.10 64-bit installed on a 100 GB disk.

Created with Vagrant 2.2.19 and VirtualBox 6.1.30.

### Usage
See box on Vagrant Cloud: [acntech/ubuntu](https://app.vagrantup.com/acntech/boxes/ubuntu).

See code on GitHub: [acntech/vagrant-basic](https://github.com/acntech/vagrant-basic).

Create a ```Vagrantfile``` with the following content inside an empty folder:
```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "acntech/ubuntu"
end
```

Start the box by issuing the following command from the command line inside the folder:
```
vagrant up
```

#### Customizations
The box can be customized further by setting VM name, CPU count, memory size and other parameters in the `Vagrantfile`:
```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "acntech/ubuntu"

  config.vm.provider "virtualbox" do |vb|
    # Name to display in VirtualBox
    vb.name = "AcnTech Ubuntu Custom"
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
    # Customize CPU count
    vb.cpus = "2"
    # Customize the amount of memory
    vb.memory = "2048"
  end
end
```
See more details on the [Vagrant homepage](https://www.vagrantup.com/docs/vagrantfile).

#### Keyboard language and layout
The box is default setup to use `us` keyboard layout. To change this you can do it by using the following `Vagrantfile`:
```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "acntech/ubuntu"
  config.vm.provision "shell", inline: "DEBIAN_FRONTEND=noninteractive localectl set-keymap <keymap>"
  config.vm.provision "shell", inline: "DEBIAN_FRONTEND=noninteractive localectl set-x11-keymap <keymap>"
end
```
The `<keymap>` is typically a country code. See more details on this [wiki page](https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration).

| :warning: **You should restart the box after provisioning, e.g. by using the commands** `vagrant halt` **then** `vagrant up`**.** |
| --- |
