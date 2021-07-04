## Linux

https://upload.wikimedia.org/wikipedia/commons/1/1b/Linux_Distribution_Timeline.svg
https://www.office.com/?auth=1


### top commands:

`sudo apt update && sudo apt upgrade`
`sudo apt autoremove && sudo apt autoclean`
`flatpak update`

```bash
    sudo apt install tlp smartmontools flatpak samba neovim
    sudo apt install htop lftp intel-microcode
```

## Hotkeys

`Ctrl+h` - show hidne files
> eddy for deb files

```bash
    sudo add-apt-repository -r ppa:cherokee-webserver/ppa
    sudo apt-key list
```

```bash
apt list --installed
apt list --upgradable
sudo apt update / upgrade
sudo apt update && sudo apt upgrade
apt-get dist-upgrade
```

```bash
sudo apt autoclean
sudo apt clean
sudo apt autoremove
sudo apt autoremove && sudo apt autoclean
```


`dpkg -i ~/Downloads/atom-amd64.deb`

[kali linux] `apt-get install metasploit-framework`

***********
## DESKTOP
***********
	Pantheon
```
		sudo add-apt-repository ppa:elementary-os/daily
		sudo apt update
		sudo apt install elementary-desktop
```
	gnome
	budgie:
```
		sudo add-apt-repository ppa:budgie-remix/ppa
		sudo apt update
		sudo apt install budgie-desktop
			sudo apt purge budgie-desktop

		sudo ppa-purge ppa:budgie-remix/ppa
```

***************
## which samba
***************
`sudo apt install samba`
	smb.conf
	/var/lib/samba/dhcp.conf
	
	mkdir smbshare [path:// home/ufaat/smbshare]
	ls -l
	sudo nano /etc/samba/smb.conf
		textFile:
			[smbshare]
				comment = samba on kali
				path = /home/ufaat/smbshare
				read only = no
				browsable = yes
		Ctrl+o, ctrl+x
	sudo service smbd restart
	sudo ufw allow samba // update the firewall rules to allow samba traffic
	[sudo apt install ufw]
	sudo smbpasswd -a ufaat // since samba doesn't use the system account oassword, 
					we need to set up a Samba password for our user account
	ifconfig [\\192.168.1.43\smbshare][kali]
******************	
## openssh-server
******************
```bash
	sudo service ssh status
	sudo vim /etc/ssh/sshd_config
	sudo service ssh start/ stop

	scp remoteHost:localFile destinationDirectory
	scp localFile remoteHost:destinationDirectory
```

*******
## ufw
*******
```bash
	sudo ufw status
	sudo nano[vim] /etc/default/ufw
		textFile: IPV6 = yes
	sudo ufw disable
	sudo ufw enable
```

```bash
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install fish
	which fish
	whereis fish
	man chsh
	chsh -s /usr/bin/fish
	
	mkdir -p ~/.config/fish
	vim ~/.config/fish/config.fish
```

reboot

**********
## neovim
**********

ranger // file manager

************
## neofetch
************

less /etc/os-release
cat /etc/*release
uname -a

*******
## tlp
*******
sudo tlp-stat

sudo apt install conky-all

***********
## flatpak
***********
```bash
flatpak uninstall --unused
flatpak remotes
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-delete flathub
flatpak search steam
flatpak install flathub com.valvesoftware.Steam
flatpack uninstall com...
flatpak update
flatpak list --app
flatpak history

sudo apt remove app_name
sudo apt purge app_name
sudo apt autoremove
```

*******
## try
*******
	tilix

chsh -s $(which zsh)

omf install lambda

mount | column -t
cat /etc/passwd | column -t -s :

do
ping -c l google.com > /dev/null 2>&1 && break
done ;

lsblk # list block devices

**********
## backup
**********
	ssh username@yourdomain.com
	ssh usernm@ipAddress

	database with ssh
		mysqldump --add-drop-table -u [username] -p [tablename] > [backupfilename].sql
	
	data with ssh
		tar -vcf yourbackupfilename.tar /directory/path
	
	restoring with ssh
		tar -vxf yourbackupfilename.tar

		mysql -u [username] -p [tablename] < [databasebackupfilename].sql

*******
## tar
*******

## FONTS
	~/.local/share/fonts

*********
## files
*********
	mv ~/Downloads/*.mp3 ~/Music/

sudo dpkg -i /tmp/erlTKy/LBRY_0.45.1.deb

echo $SHELL
less /etc/shells