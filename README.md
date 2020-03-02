# Workstation Ansible Setup
This is my repository for my workstation setup with Ansible roles.


## Example Playbook
To install all required packages, use the `post_install.yml` Playbook.


## Requirements
You will require a running instance of Ubuntu or Fedora.

Tested and running on:
- Ubuntu 18.04 LTS


## Software included
- [ ] Debian
    - [X] Ansible
    - [X] Docker
        - [X] Docker-Compose
    - [X] Firefox
    - [X] Git
    - [ ] Kubernetes
    - [ ] Python3
    - [ ] SSH-Keys
    - [ ] Spotify
    - [ ] Terraform
    - [X] Terminator
    - [X] Vagrant
    - [X] Vim
    - [X] VirtualBox
    - [X] VS Code

- [ ] Fedora


#### Configuration Files to be Included
- Bashrc
- Vimrc
- Terminator-Settings
- VS Code installed plugins and whitespace cutting


#### Additional: For Gaming
- Teamspeak
- Steam
- Dota2

## ToDos
- [ ] Installation script that puts **every** script in the correct location

VS Code:
- [X] Install VS Code extensions
- [X] Put VS Code settings into correct location


Pip:
- [X] Update pip with pip

Mouse acceleration:
- [X] Deactivate mouse acceleration by default

SSH key pair:
- [X] generate by default

Install Cloud Clients
- [ ] GCloud
- [ ] Azure

Terminator Settings:
- [ ] Termiantor Profile settings


Kubernetes:
- [ ] Install Helm/Tiller

TMUX:
- [ ] Install Tmux

## Lessons Learned
#### using the DConf module
13.02.2020 - Useing the DConf Module requires the value to be in a "GVariant format". This means you need to write your value `flat` like this: `\'flat\'`
