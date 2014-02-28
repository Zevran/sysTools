# !/bin/sh

base_pgk="sudo vim zsh curl libtool screen unzip htop cron-apt"
node_pgk="node npm python"
dev_pkg="gcc g++ make gdb libtool cmake perl"
net_pkg="ufw fail2ban nmap hping3"
version_pkg="git git-core mercurial svn"
monit_pkdg="lynis fail2ban sysstat rkhunter psad"

packages="$base_pgk $node_pgk $dev_pkg $version_pkg"

if [[ "$(id -u)" != "0" ]]; then
	echo "[-] This script must be run as root"
	exit -1
fi

for i in $packages; do
	echo "[+] Installing $i..."
	apt-get install -y $i > /dev/null
done

for u in `ls /home/`; do
	sudo -u $u -H curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
done
