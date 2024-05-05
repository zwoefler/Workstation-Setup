#!/bin/bash


install() {
    echo "Installing Steam"
    sudo apt update && sudo apt upgrade -y
    sudo dpkg --add-architecture i386
    echo "Install Steam on Ubuntu via Steam APT Repository"
    echo "Importing GPG key"
    curl -s http://repo.steampowered.com/steam/archive/stable/steam.gpg | sudo gpg --dearmor -o /usr/share/keyrings/steam.gpg > /dev/null

    echo "Add steam apt repository"
    echo deb [arch=amd64 signed-by=/usr/share/keyrings/steam.gpg] http://repo.steampowered.com/steam/ stable steam | sudo tee /etc/apt/sources.list.d/steam.list

    echo "Update apt cache after steam PPA import"
    sudo apt update

    echo "Install Steam via package manager"
    sudo apt install -y \
      libgl1-mesa-dri:amd64 \
      libgl1-mesa-dri:i386 \
      libgl1-mesa-glx:amd64 \
      libgl1-mesa-glx:i386 \
      steam

    echo "Remove extra lists"
    sudo rm /etc/apt/sources.list.d/steam-beta.list
    sudo rm /etc/apt/sources.list.d/steam-stable.list

    echo "Refresh apt index"
    sudo apt update
}


uninstall() {
    echo "Uninstalling Steam"
}


# Check if uninstall option is provided
if [ "$1" == "uninstall" ]; then
    uninstall
    exit 0
fi

if command -v steam &> /dev/null; then
    echo -e "Steam is already installed."
else
    install
fi
