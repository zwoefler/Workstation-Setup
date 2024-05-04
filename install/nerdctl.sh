#!/bin/bash



install_nerdctl() {
    curl -fsSL https://github.com/containerd/nerdctl/releases/download/v1.7.6/nerdctl-1.7.6-linux-amd64.tar.gz
    tar Cxzvvf /usr/local nerdctl-full-1.7.6-linux-amd64.tar.gz
    containerd-rootless-setuptool.sh install
}

uninstall_nerdctl() {
    
}


# Check if uninstall option is provided
if [ "$1" == "uninstall" ]; then
    uninstall_nerdctl
    exit 0
fi


if command -v nerdctl &> /dev/null; then
    echo -e "nerdctl is already installed."
else
    install_nerdctl
fi
