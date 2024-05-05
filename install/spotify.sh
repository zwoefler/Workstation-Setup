#!/bin/bash

install() {
    echo "[SPOTIFY-INSTALL] Installing Spotify"
    echo "[SPOTIFY-INSTALL] Import GPG key"
    curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg > /dev/null

    echo "[SPOTIFY-INSTALL] Add Spotify apt repository"
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list > /dev/null

    echo "[SPOTIFY-INSTALL] Update apt cache after adding repository"
    sudo apt update

    echo "[SPOTIFY-INSTALL] Install Spotify"
    sudo apt-get install -y spotify-client
}

uninstall() {
    echo "[SPOTIFY-UNINSTALL] Uninstalling Spotify"
    echo "[SPOTIFY-UNINSTALL] Remove Spotify package"
    sudo apt-get remove -y spotify-client

    echo "[SPOTIFY-UNINSTALL] Remove Spotify repository list"
    sudo rm /etc/apt/sources.list.d/spotify.list

    echo "[SPOTIFY-UNINSTALL] Remove GPG key"
    sudo rm /etc/apt/trusted.gpg.d/spotify.gpg
}

if [ "$1" == "uninstall" ]; then
    uninstall
    exit 0
fi

if command -v spotify &> /dev/null; then
    echo -e "[SPOTIFY-INSTALL] Spotify is already installed."
else
    install
fi

# https://www.spotify.com/us/download/linux/
