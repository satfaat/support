## WSL

### start-wsl
```bash
wsl --install -d Debian
```

### update
```bash
wsl --update
wsl --status
```

### commands
```bash
wsl -l
wsl --list --verbose
wsl -l -v
```


\\wsl$\Debian\home\deby

### troubleshooting

#### Confirm WSL is enabled
```bash
Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```