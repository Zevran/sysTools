# !/bin/sh

if [[ "$(id -u)" != "0" ]]; then
	echo "[-] This script must be run as root"
	exit -1
fi

echo "[+] Installing varnish..."
curl http://repo.varnish-cache.org/debian/GPG-key.txt | apt-key add -
echo "deb http://repo.varnish-cache.org/debian/ wheezy varnish-3.0" >> /etc/apt/sources.list
apt-get update
apt-get install -y varnish
export LC_ALL=en_GB.UTF-8
