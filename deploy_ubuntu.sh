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
    echo "[DEPLOY UBUNTU] Installing configuration files..."
    echo "[DEPLOY UBUNTU] VIM"
    wget -O ~/.bashrc https://raw.githubusercontent.com/zwoefler/Dot-File-Repo/master/bash/.bashrc
    echo "[DEPLOY UBUNTU] BASHRC"
    wget -O ~/.vimrc https://raw.githubusercontent.com/zwoefler/Dot-File-Repo/master/vim/.vimrc
    echo "[DEPLOY UBUNTU] Configuration files installed successfully."
}


create_ssh_key(){
    if [ ! -f "$HOME/.ssh/id_rsa" ]; then
        echo "[DEPLOY UBUNTU] Creating SSH Key for $USER at ~/.ssh/id_rsa"
        ssh-keygen -t rsa -b 4096 -f "$HOME/.ssh/id_rsa" -N ""
    else
        echo "[DEPLOY UBUNTU] SSH Key already exists. Skipping creation."
    fi
}

###############################################################################
# INSTALLING PROFILES 
###############################################################################

install_applications(){
    local applications="$1"

    for app in "${applications[@]}"; do
        curl "${BASE_URL}${app}.sh" | bash -
    done
}


creative_profile() {
    echo "[DEPLOY UBUNTU] Installing CREATIVE profile"
}


developer_profile() {
    echo "[DEPLOY UBUNTU] Installing DEVELOPER profile"

    echo "[DEPLOY UBUNTU] Updating apt packages"
    sudo apt update

    create_ssh_key
    install_config_files
    
    echo "[DEPLOY UBUNTU] Installing python3-pip"
    sudo apt install -y python3-pip
    
    echo "[DEPLOY UBUNTU] Removing SNAP"
    sudo apt remove -y --purge snapd
    
    echo "[DEPLOY UBUNTU] Sourcing .bashrc"
    source ~/.bashrc

    applications=(
        "nerdctl"
        "vmchamp"
    )
    install_applications "$applications"
}


gaming_profile() {
    echo "[DEPLOY UBUNTU] Installing GAMING profile"
    applications=(
        "steam"
    )
    install_applications "$applications"
}



install_base() {
    echo "[DEPLOY UBUNTU] Installing BASE profile"
    sudo apt install firefox
}


personal_profile() {
    echo "[DEPLOY UBUNTU] Installing PERSONAL profile"
    applications=(
        "obsidian"
        "spotify"
    )
    install_applications "$applications"
}


###############################################################################
# COMMAND LINE PARAMETERS
###############################################################################
# When script is offline, or offline options is provided dont use URLs


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
