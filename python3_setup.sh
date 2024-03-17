#!/bin/bash

python_libraries=(
    "requests"
    "pandas"
    "jupyter"
)

# Install Python pip
sudo apt update
sudo apt install -y python-pip

pip install --upgrade pip

# Install python libraries
for library in "${python_libraries[@]}"
do
    pip install "$library"
done
