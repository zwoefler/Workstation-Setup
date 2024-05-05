#!/bin/bash

OBSIDIAN_VERSION=1.5.12



install() {
    echo "Installing Obsidian"
    wget "https://github.com/obsidianmd/obsidian-releases/releases/download/v${OBSIDIAN_VERSION}/obsidian_${OBSIDIAN_VERSION}_amd64.deb"
    sudo apt install ./obsidian_${OBSIDIAN_VERSION}_amd64.deb
    rm ./obsidian_${OBSIDIAN_VERSION}_amd64.deb
}


pull_notes_from_github(){
    echo "Pull notes from GitHub"
    # TBD
}

uninstall() {
    echo "Uninstalling Obsidian"
    sudo apt remove -y obsidian

    # Should notes directory/config also be removed?
}


# Check if uninstall option is provided
if [ "$1" == "uninstall" ]; then
    uninstall
    exit 0
fi

if command -v obsidian &> /dev/null; then
    echo -e "obsidian is already installed."
else
    install
fi
