#!/bin/bash

main() {
	echo "Fivem user and group "
	useradd -d /home/fivem -m -r -s /bin/bash -U fivem

	if [ -e /home/fivem/fx.tar.xz ]; then
		echo "  - fx.tar.xz Already exists"
		rm -fr /home/fivem/fx.tar.xz
	fi

	echo "  - Fivem Download"
	fvDlUrl="https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/679-996150c95a1d251a5c0c7841ab2f0276878334f7/fx.tar.xz"
	wget -nv -q --show-progress $fvDlUrl -O /home/fivem/fx.tar.xz
	cd /home/fivem
	tar xfJ fx.tar.xz
	wget https://raw.githubusercontent.com/Artnod-FiveM-Mods/Server-cloud-init/master/start.sh -O /home/fivem/start.sh
	wget https://raw.githubusercontent.com/Artnod-FiveM-Mods/Server-cloud-init/master/stop.sh -O /home/fivem/stop.sh
	wget https://raw.githubusercontent.com/Artnod-FiveM-Mods/Server-cloud-init/master/fivem.service -O /etc/systemd/system/fivem.service

	echo "  - Fivem public server-data"
	git clone https://github.com/citizenfx/cfx-server-data.git /home/fivem/server-data

	echo "  - Fivem Change Policies"
	chown -R fivem:fivem /home/fivem/
	chmod -R 0775 /home/fivem/
	chown root.root /etc/systemd/system/fivem.service
	chmod 0777 /etc/systemd/system/fivem.service
	chown root.root /etc/systemd/system/fivem.service
	chmod 0777 /etc/systemd/system/fivem.service
	
	echo "  - FiveM Create deamon"
	systemctl enable fivem.service
	
	echo "  - Script ended successfully. You can now:"
	echo "    - Configure /home/fivem/server-data/server.cfg"
	echo "    - Add resources in /home/fivem/server-data/resources/"
}


if [ -z $1 ]; then
	echo "  - https://github.com/Artnod-FiveM-Mods/Server-cloud-init"
	exit 0
fi

while getopts "hcoi" opt; do
	case "$opt" in
		h)
			showHelp
			exit 0
			;;
		i)
			RUNINSTALL=1
			;;
	esac
done
if [ $RUNINSTALL -eq 1 ]; then
	main
fi
