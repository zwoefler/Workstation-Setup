#!/bin/bash

echo "Creating SSH Key for $USER at ~/.ssh/id_rsa"
ssh-keygen -t rsa -b 4096 -f "$HOME/.ssh/id_rsa" -N ""

echo "Updating apt packages"
sudo apt update


echo "Installing dotfiles for"
echo "VIM"
echo "BASHRC"
wget -O ~/.bashrc https://raw.githubusercontent.com/zwoefler/Dot-File-Repo/master/bash/.bashrc
wget -O ~/.vimrc https://raw.githubusercontent.com/zwoefler/Dot-File-Repo/master/vim/.vimrc


echo "Installing python3-pip"
sudo apt install -y python3-pip


echo "Sourcing .bashrc"
source ~/.bashrc
