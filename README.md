# Server_cloud-init
Cloud-init config file for Linux FiveM Server (tested on Debian Stretch)

Cloud-init Features:
  - Update sources list
  - Upgrade installed packages
  - Install ``mysql-server/client``, ``xz-utils``, ``git`` and ``screen``
  - Optionnaly add ``rsa_private/public keys``
  - Download and run shell script

Shell-script Features:
  - Create user ``fivem``
  - Download and install ``FiveM build`` from [runtime.fivem.net](https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/)
  - Clone ``Fivem public server-data`` from [github.com](https://github.com/citizenfx/cfx-server-data)
  - Create FiveM deamon
  - Optionnaly clone private repo from github
  
  
  
Simple Use:  
  - Fork this repo
  - Update FiveM build url in ``bootstrap.sh`` with last release from [runtime.fivem.net](https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/)
  - Use [cloud.init](https://github.com/Artnod-FiveM-Mods/Server_cloud-init/blob/master/cloud.init) to deploy a server
