echo "## installing git"
yes | sudo pacman -S git

echo "## installing zsh"
yes | sudo pacman -S zsh
echo "## installing oh-my-zsh framework"
sudo curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

echo "## installing Hyper - JS + HTML + CSS terminal"
yes | yaourt -S hyper


echo "## download and install Hack typeface for programming"
mkdir -p ~/temp
mkdir -p ~/.fonts/hack-ttf
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip -O ~/temp
tar -xvc ~/temp/Hack-v3.*.zip -C ~/.fonts
rm -f ~/temp/Hack-v3.*.zip
echo "##updating font cache"
sudo fc-cache -vf

echo " ## installing VSCode"
yes | yaourt -S visual-studio-code-bin

echo "## installing IntelliJ Idea"
yes | yaourt -S intellij-idea-community-edition


echo "## setup NodeJS"
yes | yaourt -S nvm
nvm ls --remote
nvm install 10
node -v
npm -v
echo "## install Yarn package manager globally"
npm install -g yarn
echo "## adding Yarn’s binary to $PATH in ~/.bashrc."
echo 'export PATH=$PATH:~/.yarn/bin' >> ~/.bashrc

echo "## installing JDK"
yaourt -S jdk
sudo archlinux-java set java-10-sdk
archlinux-java status