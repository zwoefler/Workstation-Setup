#!/bin/bash

OBSIDIAN_VERSION=1.5.12

echo "Installing Obsidian"
wget "https://github.com/obsidianmd/obsidian-releases/releases/download/v$OBSIDIAN_VERSION/obsidian_$OBSIDIAN_VERSION_amd64.deb"
sudo apt install ./obsidian_$OBSIDIAN_VERSION_amd64.deb

