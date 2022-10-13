@echo off
title INFO
rem: msinfo32
echo %DATE%
echo %TIME%
HOSTNAME
whoami
echo  **************
echo * WINDOWS INFO *
echo  **************
VER
systeminfo | findstr /c:"OS Name"
systeminfo | findstr /c:"OS Version"
systeminfo | findstr /c:"OS System Type"
echo
echo HARDWARE INFO
echo
systeminfo | findstr /c:"Total Physical Memory"
wmic cpu get name
wmic diskdrive get name,model,size
wmic path win32_videocontroller get name
wmic memorychip get memorytype
wmic memorychip get SMBIOSMemorytype
:: wmic memorychip get | clip
echo NETWORK INFO /n
ipconfig | findstr IPv4
ipconfig | findstr IPv6
pause