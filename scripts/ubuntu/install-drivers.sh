# encontrando e salvando working directory, diretório atual de trabalho
wd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# VARIABLES
$drivers_folder = ~/0tau/drivers


echo ## adicionar suporte a arquitetura 32bits no sistema 64bits
sudo dpkg --add-architecture i386



echo ########################################
echo ## ADICIONANDO REPOSITORIOS
echo ########################################


echo ## openrazer driver and apps for razer devices on linux
sudo add-apt-repository ppa:openrazer/stable


echo ########################################
echo ## COMEÇANDO A INSTALAR OS APLICATIVOS
echo ########################################

echo ## openrazer driver and apps for razer devices on linux
sudo apt install openrazer-meta

echo ## limpando bibliotecas e dependencias que nao são mais utilizadas
sudo apt autoremove

