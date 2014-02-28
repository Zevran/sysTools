# !/bin/sh

if [[ "$(id -u)" != "0" ]]; then
	echo "[-] This script must be run as root"
	exit -1
fi

psadConf="/etc/psad/psad.conf"

echo "[+] Configure psad.conf"
if [[ -f "$psadConf" ]]; then
	read -p "[?] Email Adress ? " email
	sed -i "s/root@localhost/$email/g" $psadConf

	read -p "[?] Hostname ? " hostname
	sed -i "s/_CHANGEME_/$hostname/g" $psadConf

	sed -i "s/any/NOT_USED/g" $psadConf

	read -p "[?] Log file name ? " logfile
	sed -i "s/\/var\/log\/messages/\/var\/log\/$logfile/g" $psadConf

	read -p "[?] Email when limit threshold reached ? [Y/N] " char
	sed -i "s/EMAIL_LIMIT_STATUS_MSG      Y;/EMAIL_LIMIT_STATUS_MSG      $char;/g" $psadConf

	read -p "[?] Auto manage firewall rulesets ? [Y/N] " char
	sed -i "s/ENABLE_AUTO_IDS             N;/ENABLE_AUTO_IDS             $char;/g" $psadConf

	read -p "[?] Danger Level ? [1-5] " number
	sed -i "s/AUTO_IDS_DANGER_LEVEL       5;/AUTO_IDS_DANGER_LEVEL       $number;/g" $psadConf

	read -p "[?] Ban Time ? [seconds] " seconds
	sed -i "s/AUTO_BLOCK_TIMEOUT          3600;/AUTO_BLOCK_TIMEOUT          $seconds;/g" $psadConf

	read -p "[?] Disable suppresion of auto-blocking emails ? [Y/N] " char
	sed -i "s/ENABLE_AUTO_IDS_EMAILS      Y;/ENABLE_AUTO_IDS_EMAILS      $char;/g" $psadConf

	read -p "[?] Change mail bin path ? " path
	sed -i "s/mailCmd          /bin/mail;/mailCmd          $path;/g" $psadConf
fi

if [[ -f "/etc/psad/auto_dl" ]]; then
	echo "127.0.0.1	0;" >> /etc/psad/auto_dl
fi

service psad restart
