#!/bin/bash


## entering superuser
sudo su

## updating the system and packages
pacman -Syyu

## installing needed tools
sudo pacman -S hddtemp lm_sensors
## initializing sensors configuration
sensors-detect
## adding privilege to regular user on hddtemp so conky can use it
chmod +s /usr/sbin/hddtemp

echo "##installing dependencies for compiling conky with the NVIDIA and other FLAGS"
pacman -S lua51 libx11 libxft libxdamage libncurses5 libxinerama

echo "## install Conky"
pacman -S conky
echo "## creating fonts directory to use with conky"
mkdir ~/.fonts
cd ~/.fonts
echo "## downloading font pack."
wget https://www.dropbox.com/s/vbc3ehoxkq42k27/Fonts_conky.tar.gz?dl=0 -O Fonts_conky.tar.gz
tar -vzxf Fonts_conky.tar.gz
echo "## cleaning downloaded files"
rm -fr Fonts_conky.tar.gz
echo "## updating font cache"
fc-cache -vf
echo "## setting conky to start at login"
mkdir -p ~/.conky/
cd ~/.conky
git clone https://github.com/gugutz/conky-setup.git
mv -f ./scripts/autostart.sh ~/.config/autostart