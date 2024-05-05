# Install Applications and prerequisites
Each script installs one application and requirements.
Running it like:
```SHELL
# Install
curl https://raw.githubusercontent.com/zwoefler/Workstation-Setup/master/install/<SCRIPT>.sh \
    | bash -
```

installs the applications. 
Providing the `uninstall` option removes the application & configuration files

```SHELL
# Uninstall
curl https://raw.githubusercontent.com/zwoefler/Workstation-Setup/master/install/<SCRIPT>.sh \
    | bash -s -- uninstall
```


## ToDO
- [ ] Add uninstall function
- [ ] Basic setup for script: Install, Uninstall section, CLI parameters check if isntalled, 
