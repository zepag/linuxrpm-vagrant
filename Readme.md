## Centos 7 based Vagrant VM for building RPMs

This Vagrant setup provisions the following (over a base image: chef/centos7):
* Installs the latest docker 
* Installs the latest docker-compose
* Installs other utilities: git,vim

All vagrant commands described here must be run in the folder where the VagrantFile is. Otherwise, check Vagrant's dock in order to understand its loading order.

### First run

```
vagrant up --provider virtualbox
```

This Vagrant file is based on chef/centos7 base box, which is not available for e.g. libvirt.
If you''re using Linux for example, linux is likely to be your default provider.
Hence the need to specify the provider.
In MacOSX, virtualbox is the default, and therefore "vagrant up" might be sufficient.

### Connect to VM

```
vagrant ssh
```

### Halt VM

```
vagrant halt
```

### Cleanup

```
vagrant destroy
```
