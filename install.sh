#!/bin/bash

####
## Adding path to PATH env
####

echo "===== sysTools installation ====="

CMD="PATH="PATH:/opt/sysTools/cmd"; export PATH"

if [ -d /etc/profile.d ]; then # Debian Path predefs
	echo $CMD >> /etc/profile.d/sysTools.sh
fi

if [ -f /etc/profile.d/sysTools.sh ]; then
	echo "===== Success to add PATH env ====="
else
	echo "===== Fail to add PATH env ====="
fi

