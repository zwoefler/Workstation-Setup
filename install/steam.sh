#!/bin/bash


install() {
    echo "[STEAM-INSTALL] Installing Steam"
    sudo apt update && sudo apt upgrade -y
    sudo dpkg --add-architecture i386
    echo "[STEAM-INSTALL] Install Steam on Ubuntu via Steam APT Repository"
    echo "[STEAM-INSTALL] Importing GPG key"
    # File '/usr/share/keyrings/steam.gpg' exists. Overwrite? (y/N)
    curl -s http://repo.steampowered.com/steam/archive/stable/steam.gpg | sudo gpg --dearmor -o /usr/share/keyrings/steam.gpg > /dev/null

    echo "[STEAM-INSTALL] Add steam apt repository"
    echo deb [arch=amd64 signed-by=/usr/share/keyrings/steam.gpg] http://repo.steampowered.com/steam/ stable steam | sudo tee /etc/apt/sources.list.d/steam.list

    echo "[STEAM-INSTALL] Update apt cache after steam PPA import"
    sudo apt update

    echo "[STEAM-INSTALL] Install Steam via package manager"
    sudo apt install -y \
      libgl1-mesa-dri:amd64 \
      libgl1-mesa-dri:i386 \
      libgl1-mesa-glx:amd64 \
      libgl1-mesa-glx:i386 \
      steam

    echo "[STEAM-INSTALL] Remove extra lists"
    sudo rm /etc/apt/sources.list.d/steam-beta.list
    sudo rm /etc/apt/sources.list.d/steam-stable.list

    echo "[STEAM-INSTALL] Refresh apt index"
    sudo apt update
}


uninstall() {
    echo "[STEAM-UNINSTALL] Uninstalling Steam"
    echo "[STEAM-UNINSTALL] Removing apt packages"
    sudo apt remove -y \
      libgl1-mesa-dri:amd64 \
      libgl1-mesa-dri:i386 \
      libgl1-mesa-glx:amd64 \
      libgl1-mesa-glx:i386 \
      steam

    echo "[STEAM-UNINSTALL] Removing steam lists"
    sudo rm /etc/apt/sources.list.d/steam*

    echo "[STEAM-UNINSTALL] Removing GPG key"
    sudo rm /usr/share/keyrings/steam.gpg

    echo "[STEAM_UNINSTALL] Remove i386 architeture that dpkg is aware off"
    sudo dpkg --remove-architecture i386

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
