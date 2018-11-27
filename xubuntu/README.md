# AcnTech Xubuntu
AcnTech Xubuntu box with Xubuntu Desktop 18.04.1 LTS 64-bit installed on a 100 GB disk.

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
