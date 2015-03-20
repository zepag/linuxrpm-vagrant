## Centos 7 based Vagrant VM for docker

Quick Vagrant setup to get the latest docker installed.

All vagrant commands described here must be run in the folder where the VagrantFile is. Otherwise, check Vagrant's dock in order to understand its loading order.

### Things you might want to change/modify !

#### Users folder mapping

Default path is MacOS X specific and needed to be able to map local folder(s) to Volume(s) in docker. (Under Windows 7, this would map C:\Users to /Users)

```
config.vm.synced_folder "/Users", "/Users"
```

If you're working on linux or windows, adapt it to suit your setup.
If you just don't need to map any local folders in your VM, just comment it. 

#### Basic VM configurations

Self explanatory.

```
config.vm.network "private_network", ip: "192.168.60.100"
vb.cpus = 4
vb.memory = 4096
config.vm.hostname = "dockerbox"
```

### Launch a new VM

Choose a provisioning method for the first `vagrant up`.
If you don't specify a provisioning method, both will run, which is just a waste of your time. Alternatively, you can edit the Vagrant file and comment out the provisioning method you don't wish to use.

#### Shell script

```
vagrant up --provision --provision-with shell
```

#### Ansible

```
vagrant up --provision --provision-with ansible
```

### Usage

You can now access docker as vagrant user within the VM or over the network on port 2375.

- SSH into the VM and start using docker 

  ```
  vagrant ssh
  ```

  and start using docker.
- Or if you want to use your host's docker client, get the VM's IP address. You can now log out of the VM.
    - Open a new shell on your Host
    - Set the DOCKER_HOST environment variable

    ```
    export DOCKER_HOST="tcp://<the VM's IP address>:2375"
    ```

- Test docker connection

```
$ docker info
Containers: 0
Images: 0
Storage Driver: devicemapper
 Pool Name: docker-253:1-135257989-pool
 Pool Blocksize: 65.54 kB
 Data file: /var/lib/docker/devicemapper/devicemapper/data
 Metadata file: /var/lib/docker/devicemapper/devicemapper/metadata
 Data Space Used: 307.2 MB
 Data Space Total: 107.4 GB
 Metadata Space Used: 733.2 kB
 Metadata Space Total: 2.147 GB
 Library Version: 1.02.82-git (2013-10-04)
Execution Driver: native-0.2
Kernel Version: 3.10.0-123.el7.x86_64
Operating System: CentOS Linux 7 (Core)
CPUs: 4
Total Memory: 3.704 GiB
Name: dockerbox
ID: AZ6C:XSUS:W2DV:ZPJ5:XQGZ:2CPG:MV5J:6BLF:WYZO:TBXH:6VCV:HBIF
```
