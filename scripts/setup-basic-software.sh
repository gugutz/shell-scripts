# encontrando e salvando working directory, diretório atual de trabalho
wd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# VARIABLES
$debsfolder = ./
echo 'adiciona os repositorios basicos'
sudo sed 's/# deb/deb/' -i /etc/apt/sources.list


echo ## adicionar suporte a arquitetura 32bits no sistema 64bits
sudo dpkg --add-architecture i386



echo ########################################
echo ## ADICIONANDO REPOSITORIOS
echo ########################################

# Telegram
sudo add-apt-repository ppa:atareao/telegram -y
# Ubuntu After Install
sudo add-apt-repository ppa:thefanclub/ubuntu-after-install  -y
# Remmina Remote Desktop Client
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next  -y
# OBSStudio
sudo add-apt-repository ppa:obsproject/obs-studio -y
# hexchat
sudo add-apt-repository ppa:gwendal-lebihan-dev/hexchat-stable -y

echo ## depot multisystem liveusb creator
sudo apt-add-repository 'deb http://liveusb.info/multisystem/depot all main'
wget -q -O - http://liveusb.info/multisystem/depot/multisystem.asc | sudo apt-key add -

## APPS DE IMAGEM

sudo add-apt-repository ppa:otto-kesselgulasch/gimp -y
sudo add-apt-repository ppa:inkscape.dev/stable -y 
sudo add-apt-repository ppa:thomas-schiex/blender -y

## APPS DE ASTRONOMIA

sudo add-apt-repository ppa:lock042/siril -y #SIRIL
sudo apt-add-repository ppa:mutlaqja/ppa -y #KSTARS


echo "Finished importing repository keys"
echo "Updating apt..."
sudo apt update

echo ########################################
echo COMEÇANDO A INSTALAR OS APLICATIVOS
echo ########################################

echo "## instalando snaps package format..."
sudo apt install snapd  -y

echo "## instalando conky..."
sudo apt install conky-all  -y

echo ## telegram
sudo apt install telegram  -y

echo ## f3 fight flash fraud USB disk size checker
sudo apt install f3  -y

# echo ## "google chrome download link"
# wget 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chrome-latest.deb'
# sudo dpkg -i google-chrome-stable_current_amd64.deb

echo "discord (download .deb)"
wget https://discordapp.com/api/download?platform=linux&format=deb -O discord.deb
sudo dpkg -i discord.deb

echo "whatsie whatsapp clone" red
wget 'https://github.com/gsantner/whatsie/releases/download/v2.1.0/whatsie-2.1.0-linux-amd64.deb -O whatsie.deb'
sudo dpkg -i whatsie.deb


echo "depot multisystem liveusb creator"
sudo apt-get install multisystem


echo "HexChat IRC client"
sudo apt install hexchat  -y

#echo remimna remote desktop client
#sudo apt install remmina remmina-plugin-rdp libfreerdp-plugins-standard  -y

echo "OBS studio (record screen)"
sudo apt install obs-studio -y

echo "samba windows net protocol"
sudo apt install samba -y

echo "bchunk - Conversor de .bin em .iso"
sudo apt install bchunk

#echo "clamav antivirus open source"
#sudo apt install clamav -y
#sudo apt install clamtk -y


## UTILITÁRIOS ADMINISTRATIVOS E DE SISTEMA

echo "nautilus-admin para adicionar a opcao "Abrir como Administrador""
sudo apt install nautilus-admin


echo ########################################
echo SOFTWARES PARA BANCOS
echo ########################################

wget https://www14.bancobrasil.com.br/downloads/ws/linux/diagbb-1.0.64.run -O diagbb.run



echo ##############################
echo SOFTWARES DE GRÁFICO
echo ##############################

echo "## Pinta (MSPaint-like app)"
sudo apt install pinta -y

echo "## Inkscape (software tipo Illustrator)"
sudo apt install inkscape -y



echo ##############################
echo SOFTWARE ASTRONOMIA #####
echo ##############################

# echo "astropy (biblioteca em python requerida em diversos software de astronomia)"
# sudo apt install python-dev -y

# echo "astromatic"
# sudo apt install astromatic -y

# echo "## siril" # image alignment

# sudo apt update
# sudo apt install siril -y

# echo "## kstars"
# sudo apt install indi-full kstars-bleeding -y



echo ########################################
echo INSTALANDO EXTENSÕES GNOME
echo ########################################


#sudo apt install -y gnome-tweak-tool gnome-shell-extension-top-icons-plus gnome-shell-extension-dashtodock gnome-shell-extension-better-volume gnome-shell-extension-refreshwifi gnome-shell-extension-disconnect-wifi


echo ########################################
echo INSTAÇÃO DE OUTROS SOFTWARES
echo ########################################


## Pergunta se o usuário deseja instalar o script de jogos
function instalarDevTools(){
	read -p "Setup dev enviroment now? $foo? [yn]" answer
		if [[ $answer = y ]] ; then
		  ./setup-dev-enviroment.sh
		fi
	}


## Pergunta se o usuário deseja instalar o script de jogos
function instalarJogos(){
	read -p "Deseja instalar jogos? $foo? [yn]" answer
		if [[ $answer = y ]] ; then
		  ./install-gaming.sh
		fi
	}
	
## Pergunta se o usuário deseja instalar o script de jogos
function instalarNetTools(){
	read -p "Deseja instalar net tools? $foo? [yn]" answer
		if [[ $answer = y ]] ; then
		  ./install-nettools.sh
		fi
	}
	
	
echo ########################################
echo ## FINALIZANDO
echo ########################################


echo limpando bibliotecas e dependencias que nao são mais utilizadas
sudo apt autoremove
sudo apt autoclean




