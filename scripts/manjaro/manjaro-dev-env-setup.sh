echo "# SETTING UP INITIAL ENVIRONMENT" | boxes

echo "## entering superuser"
sudo su

echo "## updating repositories and system before continuing..."
pacman -Syyu
echo "## update done!"

echo "## installing git"
pacman -Sq --noconfirm git

echo "# setting up command-line environment" | boxes

echo "## installing zsh shell" 
pacman -Sq --noconfirm zsh

echo "## installing oh-my-zsh framework"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

echo "## installing fish shell"
pacman -Sq --noconfirm zsh

echo "## installing Hyper terminal" | lolcat
yaourt -Sq --noconfirm hyper

echo "## download and install Hack typeface for programming" | boxes
mkdir -p ~/temp
mkdir -p ~/.fonts/hack-ttf
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip -O ~/temp
tar -xvc ~/temp/Hack-v3.*.zip -C ~/.fonts
rm -f ~/temp/Hack-v3.*.zip
echo "##updating font cache" 
fc-cache -vf

echo " ## installing VSCode" | boxes
yaourt -Sq --noconfirm visual-studio-code-bin

echo "## installing IntelliJ Idea" | boxes
yaourt -Sq --noconfirm intellij-idea-community-edition


echo "## setup NodeJS" | boxes
yaourt -Sq --noconfirm nvm
nvm ls --remote
nvm install 10
node -v
npm -v
echo "## install Yarn package manager globally" 
npm install -g yarn
echo "## adding Yarn’s binary to $PATH in ~/.bashrc." 
echo 'export PATH=$PATH:~/.yarn/bin' >> ~/.bashrc

echo "## installing JDK" | boxes
yaourt -Sq --noconfirm jdk
archlinux-java set java-10-sdk
archlinux-java status


echo "## installing asdf extensible version manager" | boxes
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.2

echo "## adding asdf to PATH to be used system-wide"
[[ -Sq --noconfirm /usr/bin/zsh ]] && echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc &
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
[[ -Sq --noconfirm /usr/bin/zsh ]] && echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc & 
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc

sudo pacman -Sq --noconfirm wxgtk
exec $SHELL

echo "## installing language plugins for asdf" | boxes
asdf plugin-add ruby
asdf plugin-add erlang
asdf plugin-add elixir
asdf plugin-add python
asdf plugin-add golang
asdf plugin-add rust
asdf plugin-add haskell
asdf plugin-add lua
asdf plugin-add clojure
asdf plugin-add crystal
# Imports Node.js release team's OpenPGP keys to main keyring
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf plugin-add nodejs
echo "## languages plugins installed"

echo "## installing languages..." | boxes

## Ruby
asdf install ruby 2.5.1
asdf global ruby 2.5.1

## Erlang
asdf install erlang 20.3.4
asdf global erlang 20.3.2
## Elixir
asdf install elixir 1.6.4-otp-20
asdf global elixir 1.6.4-otp-20
## add line to .profile to get shell history for erlang and elixir iex
export ERL_AFLAGS="-kernel shell_history enabled"

## Python
asdf install python

## Go
asdf install golang

## Rust
asdf install rust 1.25.0
asdf global rust 1.25.0

## Haskell
asdf install haskell
asdf global haskell

## Lua
asdf install lua 5.1
asdf global lua 5.1

## Clojure
asdf install clojure 1.10.0-alpha4
asdf global clojure 1.10.0-alpha4

## Clojure
asdf install crystal 0.24.2
asdf global crystal 0.24.2

echo "## languages installed successfully"


echo "## install mariaDB" | boxes
sudo pacman -S mysql
sudo systemctl start mysqld
sudo mysql_secure_installation
