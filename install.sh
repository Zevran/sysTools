#!/bin/bash

####
## Adding path to PATH env
####

echo "===== sysTools installation ====="

CMD=/opt/sysTools/cmd

if [ -f /etc/paths.d ]; then # Mac Os Path predefs
	echo CMD >> /etc/paths.d/sysTools
elif [ -f /etc/profile.d]; then # Debian PAth predefs
	echo CMD >> /etc/profile.d/sysTools
elif [ -f /etc/profile.d/sysTools ] || [ -f /etc/paths.d/sysTools ]; then
	echo "===== Add PATH to PATH env ====="
else
	echo "===== Fail to add PATH env ====="
fi

