#!/bin/bash

print_help() {
    echo "Usage: $0 [options]"
    echo "No options provided executes the base routine"
    echo ""
    echo "Options:"
    echo "  config      Install only configuration files"
    echo "  --help, -h  Show this help message"
    echo ""
}

install_config_files(){
    echo "Installing configuration files..."
    echo "VIM"
    wget -O ~/.bashrc https://raw.githubusercontent.com/zwoefler/Dot-File-Repo/master/bash/.bashrc
    echo "BASHRC"
    wget -O ~/.vimrc https://raw.githubusercontent.com/zwoefler/Dot-File-Repo/master/vim/.vimrc
    echo "Configuration files installed successfully."
    exit 0
}

create_ssh_key(){
    if [ ! -f "$HOME/.ssh/id_rsa" ]; then
        echo "Creating SSH Key for $USER at ~/.ssh/id_rsa"
        ssh-keygen -t rsa -b 4096 -f "$HOME/.ssh/id_rsa" -N ""
    else
        echo "SSH Key already exists. Skipping creation."
    fi
}

install_base() {
    echo "Updating apt packages"
    sudo apt update

    create_ssh_key
    install_config_files
    
    echo "Installing python3-pip"
    sudo apt install -y python3-pip
    
    echo "Removing SNAP"
    sudo apt remove -y --purge snapd
    
    echo "Sourcing .bashrc"
    source ~/.bashrc
}

# Check for command line options
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    print_help
    exit 0
fi

# If config option is provided, install only config files
if [ "$1" == "config" ]; then
    install_config_files
    exit 0
fi

install_base
