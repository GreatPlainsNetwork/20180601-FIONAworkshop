# Logistics and quick references

insert map of workshop area here

## SSH quick commands

### Validate your ssh key is loaded
```
ssh-add -L
```

### Example of connections with an ssh agent
```
ssh -A -l robbg@192.168.1.144
```

Using an agent will allow you to keep an unlocked key active from system to system.  An added benifit your private key is still safe on the origin host (in most cases your workstation).
