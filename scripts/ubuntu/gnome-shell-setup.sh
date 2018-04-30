echo Installing connector to be able to install extensions from extensions.gnome.org
sudo apt install chrome-gnome-shell
touch ~/.conkyrc
cp /etc/conky/conky.conf ~/.conkyrc

sudo apt-add-repository -y ppa:teejee2008/ppa
sudo apt update
sudo apt install realpath ## required by conky-manager
sudo apt install conky-manager
