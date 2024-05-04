#!/bin/bash


NERDCTL_VERSION=1.7.6

install_nerdctl() {
    echo "Installing Rootless nerdctli version: $NERDCTL_VERSION"
    echo "Checking requirement uidmap package is installed"
    if ! dpkg -l | grep -q uidmap; then
        echo "uidmap not installed. Installing..."
        sudo apt update
        sudo apt install -y uidmap 
    fi

    echo "Installing nerdctl"
    wget https://github.com/containerd/nerdctl/releases/download/v$NERDCTL_VERSION/nerdctl-full-$NERDCTL_VERSION-linux-amd64.tar.gz
    sudo tar Cxzvvf /usr/local nerdctl-full-$NERDCTL_VERSION-linux-amd64.tar.gz
    containerd-rootless-setuptool.sh install
    echo "Successfully installed NERDCTL"
}

uninstall_nerdctl() {
    echo "Uninstalling nerdctl, requirered packages and containerd" 
    sudo apt remove -y uidmap

    echo "Removing Containerd and nerdctl"
    # Stolen from
    # 1nachi on GITHUB GIST: https://gist.github.com/1nachi
    # https://gist.github.com/1nachi/3d283a216481078c147fce784fdbecc6#file-containerd-purge-sh    
    sudo rm -v /usr/local/bin/{containerd*,buildctl,buildkitd,bypass4*,ctd-decoder,ctr*,fuse-overlayfs,ipfs,nerdctl,rootlessctl,rootlesskit,runc,slirp4netns,tini}
    sudo rm -v /usr/local/lib/systemd/system/{containerd.service,buildkit.service,stargz-snapshotter.service}
    sudo rm -rv /opt/{cni,containerd}
    sudo rm -v /usr/local/sbin/runc
    sudo rm -rv $XDG_RUNTIME_DIR/{buildkit,containerd-rootless}
    sudo rm -rv /usr/local/share/doc/nerdctl*
    sudo rm -v /etc/bash_completion.d/nerdctl
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
