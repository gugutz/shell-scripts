# starting configuration of system for production developing in several languages
echo ## FERRAMENTAS DE DESENVOLVIMENTO (DEVTOOLS)


sudo apt update && sudo apt upgrade

echo #######################################
echo C Enviroment Setup
echo #######################################

echo ## GNU Build Essentials
sudo apt install build-essential git libsecret-1-dev fakeroot rpm libx11-dev libxkbfile-dev -y

echo ## Installing GNU Debugger
sudo apt install gdb -y







echo #######################################
echo Git Enviroment Setup
echo #######################################

echo ## Installing GIT
sudo apt install git -y






echo #######################################
echo Java Enviroment Setup
echo #######################################

echo ## Configurando ambiente de desenvolvimento Java (JDK 8u144)
sudo cp -r -v ./jdk-8u144-linux-x64 /usr/lib/jvm/jdk-8u144
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/jdk1.8.0/bin/javaws" 1
sudo update-alternatives --config java
java -version
wait 1





echo #######################################
echo JavaScript Enviroment Setup
echo #######################################

echo ## Installing NodeJS e npm (Node Package Manager)
cd ~
wget https://nodejs.org/dist/v4.2.3/node-v4.2.3-linux-x64.tar.gz

mkdir -p node
tar xvf node-v*.tar.?z --strip-components=1 -C ./node

cd ~
rm -rf node-v*

sudo mv node /opt/

echo ## Criando links simbolicos para acessar o node e NPM de qualquer lugar do sistema
sudo ln -s /opt/node/bin/node /usr/local/bin/node
sudo ln -s /opt/node/bin/npm /usr/local/bin/npm

echo ## Verificando versão do NodeJS
node -v

#echo ## Mudando a versao do NPM de 5 pra 4 porque o create-react-native-app nao funciona na versão NPM 5
#npm install -g npm@4

echo ## Installing create-react-native-app
npm install -g create-react-native-app
sudo ln -s /opt/node/bin/create-react-native-app /usr/local/bin/create-react-native-app


echo ## Installing p5-manager pra poder criar projetos p5.js com "p5 generate -b"
npm install -g p5-manager
sudo ln -s /opt/node/bin/p5manager /usr/local/bin/p5manager

echo ## Adicionando usuario atual como proprietario da pasta node
sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}

echo ## Aumentando o numero de "watches" maximo do sistema para nao dar erro ao iniciar projeto com npm start
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

echo "Installing yarn package manager for JavaScript"

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list


echo " ===> NAO ESQUECER DE INSTALAR O APP EXPO.IO NO ANDROID <==== "


echo #######################################
echo Elixir / Erlang Enviroment Setup
echo #######################################
## Add Erlang Solutions repo: 
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
## Install the Erlang/OTP platform and all of its applications: 
sudo apt-get install esl-erlang
# Install Elixir
sudo apt install elixir


echo #######################################
echo Docker
echo #######################################

echo "Docker"
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

echo "Adding Docker’s official GPG key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


echo "Docker compose"
sudo curl -L https://github.com/docker/compose/releases/download/1.20.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

echo #######################################
echo PHP Enviroment Setup
echo #######################################


echo ## Installing PHP
sudo apt install php -y

echo ## Installing composer php package manager
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

echo ## Installing PHP MySQL Extensions (mysql, mysqli, PDO)
sudo apt-get install php-mysql





echo #######################################
echo Python Enviroment Setup
echo #######################################

echo ------------------------------------------------------------------
echo ## Configurando ambiente de desenvolvimento Python
echo "Instalando PIP (python package manager)"
sudo apt-get install python-pip

echo ## instalando NumPy, SciPy e outras libraries usando PIP requeridas para Machine Learning
python -m pip install --user numpy scipy matplotlib ipython jupyter pandas sympy nose


echo ## instalando SciKit Learn com todas as dependencias via PIP ([alldeps])
pip install -U scikit-learn[alldeps]

echo #######################################
echo Haskell Enviroment Setup
echo #######################################

echo ------------------------------------------------------------------
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:hvr/ghc
sudo apt-get update
sudo apt-get install -y cabal-install ghc-7.10.3
cat >> ~/.bashrc <<EOF
export PATH="\$HOME/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:\$PATH"
EOF
export PATH=~/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:$PATH


echo #######################################
echo Databases Setup
echo #######################################

echo ## Removing mysql server
dpkg --get-selections | grep mysql
sudo apt-get remove --purge mysql-server mysql-client mysql-common -y
sudo apt-get autoremove -y
sudo apt-get autoclean -y
sudo rm -rf /var/lib/mysql/
sudo rm -rf /etc/mysql/


echo ## Installing MariaDB
sudo apt-get install mariadb-server mariadb-client

echo ## Disabling apparmor profile on mysql so that MariaDB won't give timeout error on start
## remove this line in the future if this problem resolves
sudo apt-get install apparmor-utils 
sudo aa-disable /usr/sbin/mysqld
sudo service apparmor reload

echo ## Starting MariaDB Service
sudo systemctl start mariadb.service

echo ## Calling initial config script
echo ## THIS IS MANDATORY FOR SETTING THE ROOT PASSWORD FOR THE FIRST TIME!!
sudo mysql_secure_installation

echo ## Installing mysql Workbench
sudo apt install mysql-workbench

echo ## Installing Adminer (phpMyAdmin better replacement as DB Client)

sudo mkdir /usr/share/adminer
sudo wget "http://www.adminer.org/latest.php" -O /usr/share/adminer/latest.php
sudo ln -s /usr/share/adminer/latest.php /usr/share/adminer/adminer.php
echo "Alias /adminer.php /usr/share/adminer/adminer.php" | sudo tee /etc/apache2/conf-available/adminer.conf
sudo a2enconf adminer.conf
sudo service apache2 restart

echo #######################################
echo LaTeX Enviroment Setup
echo #######################################

echo ## Installing dependencias para a classe ABNTEX2 funcionar no TexLive do ubuntu
echo LaTeX Ubuntu
sudo apt install texlive-lang-portuguese
sudo apt install texlive-latex-extra
sudo apt install texlive-publishers
echo ## Installing BiBiLaTeX
sudo apt install biblatex

echo ## Installing TexMaker
sudo apt --fix-broken install
sudo apt install texmaker
