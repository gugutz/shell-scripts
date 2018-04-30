## Install Samba Shares
sudo pacman -S samba nautilus-share gvfs-smb
sudo pacman -S samba nautilus-share gvfs-smb
sudo mkdir -p /var/lib/samba/usershare
sudo groupadd sambashare
sudo chown root:sambashare /var/lib/samba/usershare
sudo chmod 1770 /var/lib/samba/usershare
sudo cp /etc/samba/smb.conf.default /etc/samba/smb.conf
sudo nano /etc/samba/smb.conf
sudo usermod -a -G sambashare tau
systemctl enable smbd nmbd
systemctl start smbd nmbd
chmod 701 /home/tau

## Install Yaourt
sudo pacman -S yaourt

## instal telegram desktop
yaourt -S telegram-desktop

## install slack desktop
yaourt -S slack-desktop

## install Conky
sudo pacman -S conky
## creating fonts directory to use with conky
mkdir ~/.fonts
cd ~/.fonts
## downloading font pack.
wget https://www.dropbox.com/s/vbc3ehoxkq42k27/Fonts_conky.tar.gz?dl=0 -O Fonts_conky.tar.gz
tar -vzxf Fonts_conky.tar.gz
## cleaning downloaded files
rm -fr Fonts_conky.tar.gz
##updating font cache
sudo fc-cache -vf
## installing conky-manager gui
sudo pacman -S conky-manager

## installing set of terminal ASCII tools to complement terminal appearance
sudo pacman -S neofetch
sudo pacman -S screenfetch
sudo pacman -S linux_logo
sudo pacman -S cmatrix
sudo pacman -S figlet
yaourt -S toilet


## installing ArandR GUI for XrandR, a great dual monitor manager for linux
sudo pacman -S arandr
