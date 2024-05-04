# Ubuntu Machine Setup 

Automate setup of Ubuntu machine (in the future maybe Debian) by maintaining this public git repository.

Tested on:
- [X] Ubuntu 22.04

## Intent
Streamline my personal setup process of new machines.

## What this isn't!
- Not a general purpose installtion framework
- Doesn't cover everry usecase


## Usage
```SHELL
curl https://raw.githubusercontent.com/zwoefler/Workstation-Setup/master/setup.sh | bash -
```


## Applications & Profiles
The applications are sorted into profiles.
The profile are:

#### Base
- apt update
- python3-pip
- git
- colored git output in console
- .bashrc
- .vimrc
- remove snap
- add SSH key

#### Developing
- [X] KVM
- [X] nerdctl
- [X] VmChamp

#### Gaming
- [ ] Steam
- [ ] NVidia Graphics Driver
- [ ] WINE

#### Creative
- [ ] Gimp
- [ ] Inkscape
- [ ] Davinci Resolve
- [ ] OBS Studio

#### Personal
- [ ] Signal
- [ ] Spotify
- [ ] Firefox
- [ ] Obsidian
- [ ] VSCode


#### Nice to have
MOst stuff luckily works in a browser nowadays:
- [ ] Spotify
- [ ] Discord


## Inspiration
Took some inspiration from: @athackst: https://github.com/athackst/workstation_setup 
