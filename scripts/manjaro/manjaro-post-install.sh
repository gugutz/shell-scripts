echo "## entering superuser"
sudo su

echo "## Install Yaourt"
pacman -S yaourt


echo "## installing samba"
pacman -S samba nautilus-share gvfs-smb
pacman -S samba nautilus-share gvfs-smb
mkdir -p /var/lib/samba/usershare
groupadd sambashare
chown root:sambashare /var/lib/samba/usershare
chmod 1770 /var/lib/samba/usershare
cp /etc/samba/smb.conf.default /etc/samba/smb.conf
nano /etc/samba/smb.conf
usermod -a -G sambashare tau
systemctl enable smbd nmbd
systemctl start smbd nmbd
chmod 701 /home/tau

echo "## instal telegram desktop"
yaourt -S telegram-desktop


echo "## install slack desktop"
yaourt -S slack-desktop


echo "## installing set of terminal ASCII tools to complement terminal appearance"
pacman -S neofetch
pacman -S screenfetch
pacman -S linux_logo
pacman -S cmatrix
pacman -S figlet
yaourt -S toilet
yaourt -S boxes
yaourt -S beep
pacman -S cowsay
pacman -S sl
yaourt -S bash-pipes


echo "## installing ArandR GUI for XrandR, a great dual monitor manager for linux"
pacman -S arandr

echo "## installing virtual box"
pacman -S virtualbox
