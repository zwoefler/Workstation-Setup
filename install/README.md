# Install Applications and prerequisites
Install applications

Each script carries the name of the application being installed and installs all necessary requirements, like a "standalone"

Executinig the script directly installs the application, including dependencies.
The `uninstall` option removes the application


USAGE:
```SHELL
# Install
curl https://raw.githubusercontent.com/zwoefler/Workstation-Setup/master/install/<SCRIPT>.sh \
    | bash -
```

```SHELL
# Uninstall
curl https://raw.githubusercontent.com/zwoefler/Workstation-Setup/master/install/<SCRIPT>.sh \
    | bash -s -- uninstall
```


## ToDO
- [ ] Add uninstall function
- [ ] Basic setup for script: Install, Uninstall section, CLI parameters check if isntalled, 
