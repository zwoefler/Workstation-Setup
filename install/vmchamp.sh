#!/bin/bash
# INSTALLS VMCHAMP AND REQUIREMENTS


# Check if CPU supports virtualization
# Anything else than 0 is fine
if ! egrep -c '(vmx|svm)' /proc/cpuinfo &> /dev/null; then
    echo "ERROR: Your CPU does not support virtualization."
    exit 1
fi

# Check if KVM is installed, if not, install it
if ! dpkg -l | grep -q qemu-kvm; then
    echo "KVM is not installed. Installing..."
    sudo apt update
    sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
fi

# Add the current user the libvert and kvm groups
sudo adduser "$USER" libvirt
sudo adduser "$USER" kvm

# INSTALL VMCHAMP
wget https://github.com/wubbl0rz/VmChamp/releases/download/v0.0.7/VmChamp-linux-v0.0.7-amd64
mv VmChamp-linux-v0.0.7-amd64 vmchamp
chmod +x vmchamp
sudo mv vmchamp /usr/local/bin/

