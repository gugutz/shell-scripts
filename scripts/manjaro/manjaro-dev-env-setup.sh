 ## instlaling HyperJS HTML + CSS terminal
yes | yaourt -S hyper

## installing zsh
yes | pacman -S zsh

## download and install Hack typeface for programming
mkdir -p ~/temp
mkdir -p ~/.fonts/hack-ttf
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip -O ~/temp
tar -xvc ~/temp/Hack-v3.*.zip -C ~/.fonts
##updating font cache
sudo fc-cache -vf

 ## installing VSCode
yes | yaourt -S visual-studio-code-bin

## installing IntelliJ Idea
yes | yaourt -S intellij-idea-community-edition


## setup NodeJS
yes | yaourt -S nvm
nvm ls --remote
nvm install 10
node -v
npm -v

## install Yarn package manager globally
npm install -g yarn
## adding Yarn’s binary to $PATH in ~/.bashrc.
echo 'export PATH=$PATH:~/.yarn/bin' >> ~/.bashrc

