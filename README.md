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
- Base
- Developing
- Gaming
- Creative
- Personal

#### Base
- apt update
- python3-pip
- git
- colored git output in console
- .bashrc
- .vimrc
- remove snap
- add SSH key

- [X] KVM
- [X] nerdctl
- [X] VmChamp
- [X] Steam
- [ ] NVidia Graphics Driver
- [ ] WINE
- [X] Gimp
- [X] Inkscape
- [ ] Davinci Resolve
- [X] OBS Studio
- [ ] Signal
- [ ] Spotify
- [ ] Firefox
- [X] Obsidian
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
- [ ] When installing deb packages via hand, and there is an error, remove the deb package? Because on reruns this will result in naming issues! Or check if the pakcage already exists




## Inspiration
Took some inspiration from: @athackst: https://github.com/athackst/workstation_setup 
