# AcnTech Basic
AcnTech Basic box.

The box comes in two flavors, one based on Ubuntu and one based on Xubuntu.

### AcnTech Ubuntu
See details in folder [/ubuntu](/ubuntu).

### AcnTech Xubuntu
See details in folder [/xubuntu](/xubuntu).

### Prerequisites
The host computer must have _Intel VT/AMD-V_ virtualization support enabled in the BIOS.

[Oracle VirtualBox](https://www.virtualbox.org) and [Vagrant](https://www.vagrantup.com) must also be installed on the host.

### Setup
This box was created using the following setup method:

* Create new VirtualBox Machine
  * Choose name `AcnTech Ubuntu` or `AcnTech Xubuntu`
  * Choose `2048 MB` RAM
  * Choose `128 MB` Video Memory
  * Choose harddisk type `VMDK` and a `100 GB` size
* Start install from Desktop Live CD
  * Choose `Minimal installation`
  * User `Vagrant`
  * Username `vagrant`
  * Password `vagrant`
  * Hostname `acntech`
* Install required packages:
  * `sudo apt update`
  * `sudo apt -y upgrade`
  * `sudo apt -y install build-essential dkms ssh openssh-server curl wget vim`
* Installed VirtualBox Guest Additions:
  * > Machine > Devices > "Insert Guest Additions CD image..."
  * `sudo /media/cdrom/VBoxLinuxAdditions.run`
* Restart VirtualBox Machine
* Install Puppet repo
  * `sudo wget https://apt.puppetlabs.com/puppet-release-focal.deb -O /tmp/puppet.deb`
  * `sudo dpkg -i /tmp/puppet.deb`
  * `sudo rm /tmp/puppet.deb`
  * `sudo apt update`
  * `sudo apt -y install puppet`
* Added Vagrant insecure public SSH key to the vagrant user:
  * `mkdir ~/.ssh`
  * `wget --no-check-certificate https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -O ~/.ssh/authorized_keys`
* Allowed for use of the authorized keys file:
  * `sudo sed -i 's/#AuthorizedKeysFile/AuthorizedKeysFile/g' /etc/ssh/sshd_config`
* Disabled automatic updates:
  * `sudo wget --no-check-certificate https://raw.githubusercontent.com/acntech/vagrant-basic/develop/provision/system/files/10periodic -O /etc/apt/apt.conf.d/10periodic`
  * `sudo wget --no-check-certificate https://raw.githubusercontent.com/acntech/vagrant-basic/develop/provision/system/files/20auto-upgrades -O /etc/apt/apt.conf.d/20auto-upgrades`
* Add sudo access for the vagrant user:
  * `echo "vagrant ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers`
* Created vagrant folder:
  * `sudo mkdir /vagrant`
  * `sudo chown -R vagrant:vagrant /vagrant`
* Clear APT history
  * `sudo apt -y autoremove`
  * `sudo apt -y autoclean`
  * `sudo apt -y clean`
  * `sudo rm -rf /var/lib/apt/lists/*`
* Zeroed out the disk of the Vagrant box:
  * `sudo dd if=/dev/zero of=/EMPTY bs=1M`
  * `sudo rm -f /EMPTY`
* Clear BASH history:
  * `cat /dev/null > ~/.bash_history && history -c && exit`

### Packcaging
Package with `vagrant package --base "AcnTech Ubuntu"` or `vagrant package --base "AcnTech Xubuntu"`
