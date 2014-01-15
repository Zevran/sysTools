#!/bin/bash

####
## Adding path to PATH env
####

echo "===== sysTools installation ====="

CMD="export PATH='$PATH:/opt/sysTools/cmd'"

if [ -f /etc/environment ]; then # Debian Path predefs
	echo $CMD >> /etc/environment
	echo "===== Success to add PATH env ====="
else
	echo "===== Fail to add PATH env ====="
fi

