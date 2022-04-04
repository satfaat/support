## Common info
### get product key
- cmd: `wmic path softwarelicensingservice get OA3xOriginalProductKey`
- powershell: `powershell "(Get-WmiObject -query 'select * from SoftwareLicensingService').OA3xOriginalProductKey"`
- regedit: 
    Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform
    BackupProductKeyDefault

### get system info
```bash
systeminfo | Select-String "^OS Name","^OS Version"
```
- cmd: `Systeminfo.exe`

## win 11
- BIOS mode UEFI
- Secure Boot State On
- Device Encryption Support  # Trusted Platform Module

### disk check 
    if GPT:
    win+r > diskpart > list disk
    
    powershell: `Get-Disk`

#### issue: We couldn’t create a new partition or locate an existing one
    shift+f10




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