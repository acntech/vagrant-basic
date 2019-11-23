# AcnTech Xubuntu
AcnTech Xubuntu box based on Xubuntu Desktop 19.10 64-bit installed on a 100 GB disk.

Created with Vagrant 2.2.6 and VirtualBox 6.0.14.

### Packcaging
Package with `vagrant package --base "AcnTech Xubuntu"`

### Usage
See box on Vagrant Cloud: [acntech/xubuntu](https://app.vagrantup.com/acntech/boxes/xubuntu).

See code on GitHub: [acntech/vagrant-basic](https://github.com/acntech/vagrant-basic).

Create a ```Vagrantfile``` with the following content inside an empty folder:
```
Vagrant.configure("2") do |config|
  config.vm.box = "acntech/xubuntu"
end
```

Start the box by issuing the following command from the command line inside the folder:
```
vagrant up
```
