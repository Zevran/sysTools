# !/bin/sh

if [[ "$(id -u)" != "0" ]]; then
	echo "[-] This script must be run as root"
	exit -1
fi

echo "[-] Remove useless packages..."
apt-get remove exim4 > /dev/null

echo "[+] Installing postfix..."
apt-get install -y postfix
postfix stop
