## win 11
- BIOS mode UEFI
- Secure Boot State On
- Device Encryption Support  # Trusted Platform Module

### disk check 
if GPT:
win+r > diskpart > list disk

powershell: Get-Disk

## WSL
\\wsl$\Debian\home\deby

## VS Code
```bash
ls $HOME\.vscode\extensions\
```

## Certification
Trusted Root Certification Authorities
Intermediate Certification Authorities


## Support
win+r:
- msinfo32  # System information
- tpm.msc  # Trusted Platform Module

### Get info
```powershell
systeminfo | find "System Type"
```


## Files
File compare
```
fc filename1.txt filename2.txt
```

cleaner:
    C:\Windows\LiveKernelReports
        file.dmp

### tmp
C:\Users\uname\AppData\Local\Temp