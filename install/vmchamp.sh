#!/bin/bash

# Colors for echo messages
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

install_vmchamp() {
    echo "${GREEN}Downloading and installing VmChamp...${NC}"
    wget https://github.com/wubbl0rz/VmChamp/releases/download/v0.0.7/VmChamp-linux-v0.0.7-amd64
    mv VmChamp-linux-v0.0.7-amd64 vmchamp
    chmod +x vmchamp
    sudo mv vmchamp /usr/local/bin/
    echo "${GREEN}VmChamp installed successfully.${NC}"

    echo "${GREEN}checking requirements kvm and libvirt${NC}"
    if ! dpkg -l | grep -q qemu-kvm; then
        echo "${GREEN}KVM is not installed. Installing...${NC}"
        sudo apt update
        sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
    fi

    echo "${GREEN}Adding $USER to group libvirt and kvm${NC}"
    sudo adduser "$USER" libvirt
    sudo adduser "$USER" kvm
}


uninstall_vmchamp() {
    echo "${GREEN}Uninstalling VmChamp...${NC}"
    sudo rm -rf /usr/local/bin/vmchamp
    echo "${GREEN}VmChamp uninstalled successfully.${NC}"
    
    echo "${GREEN}Uninstalling packages...${NC}"
    sudo apt purge -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
    sudo apt autoremove -y
    echo "${GREEN}Packages uninstalled successfully.${NC}"

    echo "${GREEN}Removing user from groups...${NC}"
    sudo deluser "$USER" libvirt
    sudo deluser "$USER" kvm
    echo "${GREEN}User removed from groups successfully.${NC}"
}

check_CPU_supports_virtualisation() {
    if ! egrep -c '(vmx|svm)' /proc/cpuinfo &> /dev/null; then
        echo "${RED}ERROR: Your CPU does not support virtualization.${NC}"
        exit 1
    fi
}


if ! command -v vmchamp &> /dev/null; then
    check_CPU_supports_virtualisation
    install_vmchamp
else
    echo "${GREEN}VmChamp is already installed."
fi

if [ "$1" == "uninstall" ]; then
    uninstall_vmchamp
    exit 0
fi
