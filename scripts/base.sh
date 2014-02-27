# !/bin/sh

packages="git-core sudo vim zsh"

if [[ "$(id -u)" != "0" ]]; then
	echo "[-] This script must be run as root"
	exit -1
fi

for i in $packages; do
	echo "[+] Installing $i..."
	apt-get install -y $i > /dev/null
done
