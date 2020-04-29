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
### Setup for Xubuntu
1. Remove all unnecessary programs/application like pidgin messanger
2. Set Up key-Bindings to the Ubuntu standard
    - Super + UpArrow = Fullscreen current window
    - Super + Right/Left = Current window to the left or right site
    - Super + SHIFT + Right/Left = Moves current window to the next screen
    - CRTL + ALT + UpArrow/DownArrow = Switching between workspaces
    ...

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

#### Enabling Touchpad three finger click
Finding all properties for my system
`xinput`.

Receiving a list of devices. Find out the ID of the touchpad and list all settings: `xinput list-props {ID}`

Change the `Synaptics Click Action` third field to `2`.
`$ xinput set-prop 13 "Synaptics Click Action" 1 3 2 `

Further Reading: [Synaptic Touchpad Arch Wiki](https://wiki.archlinux.org/index.php/Touchpad_Synaptics#Using_xinput_to_determine_touchpad_capabilities)
