#!/bin/bash

################
# Create SSH-Key
################
ssh-keygen -t rsa -b 4096 -f "$HOME/.ssh/id_rsa" -N ""


############
# Update apt
############
sudo apt update
sudo apt upgrade -y

#################
# Install Python3
#################

python_libraries=(
    "requests"
    "pandas"
    "jupyter"
)

# Install Python pip
sudo apt install -y python3-pip

pip install --upgrade pip

# Install python libraries
for library in "${python_libraries[@]}"
do
    pip install "$library"
done

###

