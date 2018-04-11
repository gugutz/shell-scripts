# encontrando e salvando working directory, diretório atual de trabalho
wd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"



# VARIABLES
$debs_folder = ./debs
echo "adiciona os repositorios basicos" red
sudo sed 's/# deb/deb/' -i /etc/apt/sources.list


coloredEcho adicionar suporte a arquitetura 32bits no sistema 64bits
sudo dpkg --add-architecture i386



echo ########################################
echo ## Cryptocurrency Apps
echo ########################################



## ELECTRUM BITCOIN WALLET
echo Instalando dependencias Electrum
sudo apt-get install python3-setuptools python3-pyqt5 python3-pip

echo Instalando dependencias Electrum
sudo pip3 install https://download.electrum.org/3.0.2/Electrum-3.0.2.tar.gz 

sudo add-apt-repository ppa:otto-kesselgulasch/gimp -y
sudo add-apt-repository ppa:inkscape.dev/stable -y 
sudo add-apt-repository ppa:thomas-schiex/blender -y

## APPS DE ASTRONOMIA

sudo add-apt-repository ppa:lock042/siril -y #SIRIL
sudo apt-add-repository ppa:mutlaqja/ppa -y #KSTARS




echo ########################################
echo ## COMEÇANDO A INSTALAR OS APLICATIVOS
echo ########################################

coloredEcho "## instalando snaps package format..."
sudo apt install snapd  -y


coloredEcho "## telegram"
sudo apt install telegram  -y


coloredEcho "google chrome download link" red
wget 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chrome-latest.deb'
sudo dpkg -i google-chrome-stable_current_amd64.deb

coloredEcho "discord (download .deb)" red
wget https://discordapp.com/api/download?platform=linux&format=deb -O discord.deb
sudo dpkg -i discord.deb

coloredEcho "whatsie whatsapp clone" red
wget 'https://github.com/gsantner/whatsie/releases/download/v2.1.0/whatsie-2.1.0-linux-amd64.deb -O whatsie.deb'
sudo dpkg -i whatsie.deb



echo "## HexChat IRC client"
sudo apt install hexchat  -y

#echo remimna remote desktop client
#sudo apt install remmina remmina-plugin-rdp libfreerdp-plugins-standard  -y

echo "install OBS studio (record screen)"
sudo apt install obs-studio -y

echo "samba windows net protocol"
sudo apt install samba -y

## Conversor de .bin em .iso
sudo apt install bchunk

#echo "clamav antivirus open source"
#sudo apt install clamav -y
#sudo apt install clamtk -y


## UTILITÁRIOS ADMINISTRATIVOS E DE SISTEMA

# nautilus admin para adicionar a opcao "Abrir como Administrador"
sudo apt install nautilus-admin





echo ########################################
echo ## SOFTWARES PARA BANCOS
echo ########################################

wget https://www14.bancobrasil.com.br/downloads/ws/linux/diagbb-1.0.64.run -O diagbb.run



echo ##############################
echo ## SOFTWARES DE GRÁFICO
echo ##############################

echo "## Pinta (MSPaint-like app)"
sudo apt install pinta -y

echo "## GIMP"
sudo apt install gimp -y

echo "## Inkscape (software tipo Illustrator)"
sudo apt install inkscape -y

echo "## Blender"
sudo apt install blender -y


echo ##############################
echo #### SOFTWARE ASTRONOMIA #####
echo ##############################

echo "astropy (biblioteca em python requerida em diversos software de astronomia)"
sudo apt install python-dev -y

echo "astromatic"
sudo apt install astromatic -y

echo "stellarium"
sudo apt install stellarium -y


echo "## siril" # image alignment

sudo apt update
sudo apt install siril -y

echo "## kstars"
sudo apt install indi-full kstars-bleeding -y



echo ########################################
echo ## INSTALANDO EXTENSÕES GNOME
echo ########################################


#sudo apt install -y gnome-tweak-tool gnome-shell-extension-top-icons-plus gnome-shell-extension-dashtodock gnome-shell-extension-better-volume gnome-shell-extension-refreshwifi gnome-shell-extension-disconnect-wifi


echo ########################################
echo ## INSTALANDO EXTENSÕES GNOME
echo ########################################

## Pergunta se o usuário deseja instalar o script de jogos
function instalarJogos(){
	read -p "Run command $foo? [yn]" answer
		if [[ $answer = y ]] ; then
		  ./post_install_gaming.sh
		fi
	}
	
	
echo ########################################
echo ## FINALIZANDO
echo ########################################


echo limpando bibliotecas e dependencias que nao são mais utilizadas
sudo apt autoremove

