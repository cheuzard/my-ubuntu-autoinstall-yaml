#!/bin/bash
# Manual setup tasks
#updating first
sudo apt update -y && sudo apt upgrade -y

#adding flathub repo
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
#installing discord
flatpak install flathub com.discordapp.Discord -y

# Install Vencord
echo 'Installing Vencord...'
sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"

# Install Starship prompt
echo 'Installing Starship...'
curl -sS https://starship.rs/install.sh | sh

# Git setup
git config --global user.name 'cheuzard'
git config --global user.email 'hichem172019@gmail.com'

# SpotX install
echo 'Installing SpotX...'
bash <(curl -sSL https://spotx-official.github.io/run.sh)

#removing firefox snap
sudo snap remove firefox -y

#installing flatpak firefox
flatpak install flathub org.mozilla.firefox -y

curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

#todis flatpak install
flatpak install flathub com.todoist.Todoist

# Oh My Zsh installation
echo 'Installing Oh My Zsh...'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Zsh plugins
echo 'Installing Zsh plugins...'
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

cat .zshrc.pre-oh-my-zsh > .zshrc

sudo rm -r /etc/skel/.*

wget -P /home/cheuzard/Downloads http://192.168.1.40:8000/0xProtoNerdFont-Regular.ttf
sudo mkdir -p /usr/local/share/fonts
sudo mv ~/Downloads/*.ttf /usr/local/share/fonts/
fc-cache -f -v
sudo rm /home/cheuzard/post-install.sh
sudo reboot

