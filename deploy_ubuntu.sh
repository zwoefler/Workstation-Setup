#!/bin/bash

BASE_URL="https://raw.githubusercontent.com/zwoefler/Workstation-Setup/master/install/"

print_help() {
    echo "Usage: $0 [options]"
    echo "No options provided executes the base routine"
    echo ""
    echo "Options:"
    echo "  config       Install only configuration files"
    echo "  base         Install base profile"
    echo "  developer    Install developer profile"
    echo "  gaming       Install gaming profile"
    echo "  creative     Install creative profile"
    echo "  personal     Install personal profile"
    echo "  --help, -h   Show this help message"
    echo ""
}


install_config_files(){
    echo "Installing configuration files..."
    echo "VIM"
    wget -O ~/.bashrc https://raw.githubusercontent.com/zwoefler/Dot-File-Repo/master/bash/.bashrc
    echo "BASHRC"
    wget -O ~/.vimrc https://raw.githubusercontent.com/zwoefler/Dot-File-Repo/master/vim/.vimrc
    echo "Configuration files installed successfully."
}


create_ssh_key(){
    if [ ! -f "$HOME/.ssh/id_rsa" ]; then
        echo "Creating SSH Key for $USER at ~/.ssh/id_rsa"
        ssh-keygen -t rsa -b 4096 -f "$HOME/.ssh/id_rsa" -N ""
    else
        echo "SSH Key already exists. Skipping creation."
    fi
}

###############################################################################
# INSTALLING PROFILES 
###############################################################################

creative_profile() {
    echo "Installting CREATIVE profile"
}


developer_profile() {
    echo "Installing DEVELOPER profile"
    applications=(
        "nerdctl"
        "vmchamp"
    )
    for app in "${applications[@]}"; do
        curl "${BASE_URL}${app}.sh" | bash -
    done
}


gaming_profile() {
    echo "Installing GAMING profile"
    applications=(
        "steam"
    )
    for app in "${applications[@]}"; do
        curl "${BASE_URL}${app}.sh" | bash -
    done
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


personal_profile() {
    echo "Installing PERSONAL profile"
}


###############################################################################
# COMMAND LINE PARAMETERS
###############################################################################


# Handle profile options using a case statement
case "$1" in
    base)
        install_base
        ;;
    config)
        install_config_files
        ;;
    creative)
        creative_profile
        ;;
    developer)
        developer_profile
        ;;
    gaming)
        gaming_profile
        ;;
    personal)
        personal_profile
        ;;
    help | --help | -h)
        print_help
        ;;
    *) # If invalid option is provided, execute base routine
        print_help
        ;;
esac
