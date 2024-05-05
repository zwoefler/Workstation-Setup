# Ubuntu Machine Setup 

Automate setup of Ubuntu machine.

Tested on:
- [X] Ubuntu 22.04

## Intent
Streamline my personal setup process of new machines.
Run installation directly from the web:
```SHELL
curl https://raw.githubusercontent.com/zwoefler/Workstation-Setup/master/deploy_ubuntu.sh | bash -s -- developer 
```


## Usage
```SHELL
curl https://raw.githubusercontent.com/zwoefler/Workstation-Setup/master/deploy_ubuntu.sh | bash -
```

Run the help command:
```SHELL
curl https://raw.githubusercontent.com/zwoefler/Workstation-Setup/master/deploy_ubuntu.sh | bash -s -- --help
```

Bash needs to be called `bash -s -- --help`. Appending `--` treats everything after it as an argument, not a bash option.

Bash Features > Invoking Bash. p.92
https://www.gnu.org/software/bash/manual/bash.pdf


## Applications & Profiles
The applications are sorted into profiles.

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


## Issues
- [ ] Every echo of my script should have `[INSTALL-STEP]` in the output
- [ ] Newline between steps in output
- [ ] Add Uninstall function in deploy_ubuntu `--uninstall`
- [ ] Run from web, detect running from web using URLs, otherwise use local files





## Inspiration
Took some inspiration from: @athackst: https://github.com/athackst/workstation_setup 
