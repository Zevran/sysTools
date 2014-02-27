# !/bin/sh

sshKeyPath="/tmp/git-admin.pub"
gitUser="git"

read -p "Is your admin sshkey located in $sshKeyPath ? [y/n] :" char
if [ "$char" = "n" ]; then
	echo "[-] Aborted";
	exit
fi

echo "[+] Installing git-core package..."
apt-get install -y git-core > /dev/null

echo "[+] Installing gitolite package..."
apt-get install -y gitolite > /dev/null

echo "[+] Creating git user..."
adduser --system --group --shell /bin/bash --disabled-password $gitUser > /dev/null

echo "[+] Initialize gitolite..."
su git -c "gl-setup $sshKeyPath" - $gitUser
