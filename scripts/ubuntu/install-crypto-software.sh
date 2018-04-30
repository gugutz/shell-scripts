# encontrando e salvando working directory, diretório atual de trabalho
wd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# VARIABLES
$debs_folder = ./debs
echo "adiciona os repositorios basicos" red
sudo sed 's/# deb/deb/' -i /etc/apt/sources.list

echo ########################################
echo ## Cryptocurrency Apps
echo ########################################

## ELECTRUM BITCOIN WALLET
echo Installing Electrum dependencies
sudo apt-get install python3-setuptools python3-pyqt5 python3-pip

echo Installing Electrum
sudo pip3 install https://download.electrum.org/3.0.2/Electrum-3.0.2.tar.gz 

sudo add-apt-repository ppa:otto-kesselgulasch/gimp -y
sudo add-apt-repository ppa:inkscape.dev/stable -y 
sudo add-apt-repository ppa:thomas-schiex/blender -y


echo Cleaning libraries and dependencies that arent used anymore
sudo apt autoremove

