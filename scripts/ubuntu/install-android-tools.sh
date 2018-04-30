echo ########################################
echo ## APLICATIVOS ANDROID LINUX
echo ########################################

echo "Android Tools (adb & fastboot)"
sudo apt install android-tools-adb android-tools-fastboot

echo ## Anbox (Android in a Box, rodar nativamente aplicativos Android no Linux
snap install --classic anbox-installer && anbox-installer 


echo ## Install KVM (Kernel Virtual Machine) pra deixar o virtual device do android studio mais rapido.
sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils

echo ## Heimdall 
echo Instalando dependencias para Heimdall e Heimdall GUI
sudo apt  libmysqlclient20 libqt4-dbus libqt4-declarative libqt4-network libqt4-script libqt4-sql libqt4-sql-mysql libqt4-xml libqt4-xmlpatterns libqtcore4 libqtdbus4 libqtgui4 mysql-common qdbus qt-at-spi qtchooser qtcore4-l10n
