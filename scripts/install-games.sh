echo ########################################
echo JOGOS REPOSITÓRIOS
echo ########################################


## Lutris Open Gaming Platform

ver=$(lsb_release -sr); if [ $ver != "16.10" -a $ver != "17.04" -a $ver != "16.04" ]; then ver=16.04; fi 
echo "deb http://download.opensuse.org/repositories/home:/strycore/xUbuntu_$ver/ ./" | sudo tee /etc/apt/sources.list.d/lutris.list
wget -q http://download.opensuse.org/repositories/home:/strycore/xUbuntu_$ver/Release.key -O- | sudo apt-key add -




## ATUALIZANDO APT COM OS NOVOS REPOSITORIOS ADICIONADOS

coloredEcho "## atualizando sistema..."
sudo apt-get update -y && sudo apt-get upgrade -y

#coloredEcho "## corrige dependencias pelo que entendi"
#sudo apt-get install -f


echo ########################################
echo ## JOGOS
echo ########################################

echo "Lutris Open Gaming Platform"
sudo apt install lutris -y

echo "Steam"
sudo apt install steam -y

echo "Lutris Open Gaming Platform"
sudo apt install playonlinux -y

echo "Extreme Tux Racer"
sudo apt install extremetuxracer -y

echo "MegaGlest"
sudo sudo apt install megaglest -y

echo "Dolphin Emulator"
sudo apt-add-repository ppa:dolphin-emu/ppa

