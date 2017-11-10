# craft3-vagrant
Base Vagrant Box Ubuntu 16.04 PHP 7.1 Apache MySql



### Vagrant -- prerequisites ###
This project uses Vagrant for development. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html) (in that order). 

If you are using Windows, you will need to ensure that VT-x is enabled in your BIOS. This is often listed as a security setting for whatever reason.

### Setup Instructions ###

1. Check this repository out to a local folder and cd into the folder
```
 git clone https://Adpearance-Shared@bitbucket.org/adp-developers/craft-3-vagrant.git
 cd craft-3-vagrant
```

2. Edit the "vagrant-bootstrap.sh" file, replacing DB and DBPASS with your config

3. Start the box up 
```
vagrant up 
```

4. SSH in 
```
vagrant ssh
```

5. Add the following to your hosts file: 
```
192.168.22.21 craft3.dev
```

6. Navigate to the install directory and run the craft setup: 
```
cd /vagrant/craft
./craft setup
```

7. Once the setup is complete broswe to craft3.dev/admin and start building!