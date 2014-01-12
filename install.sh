#!/bin/bash

####
## Adding path to PATH env
####

echo "===== sysTools installation ====="

CMD=/opt/sysTools/cmd
cat $CMD > /etc/paths.d/sysTools

echo "===== Add PATH to PATH env ====="
