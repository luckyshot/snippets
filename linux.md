# Linux

```sh
echo "Hello" > file.txt # saves as new file
echo "Hello" >> file.txt # appends
```

## Configurations

```sh
# Set bash as default console/terminal command shell
chsh
# Enter password and type
/bin/bash
```

### Aliases

```sh
nano ~/.bashrc

alias serveron="sudo service apache2 restart;sudo service mysql start"
alias ll="ls -la"
alias _u="sudo apt update;sudo apt upgrade"
```

```sh
sudo nano /etc/apache2/sites-enabled/000-default.conf
```

### Crontab generic tweaks

```sh
# crontab -e

# Auto-update (only do this for non-critical infrastructure)
9 4 * * 1 sudo apt update && sudo apt upgrade -y

# Reduce volume at night
0 23 * * * amixer sset 'Master' 30%

```

### Systemd service

```sh
sudo nano /usr/local/sbin/xavi.sh
```
Type in any commands

```sh
chmod 0700 /usr/local/sbin/xavi.sh
sudo nano /etc/systemd/system/xavi.service
```

```ini
[Unit]
Description=Some description on what this service does
[Service]
ExecStart=/usr/local/sbin/xavi.sh
[Install]
WantedBy=multi-user.target
```

```sh
sudo systemctl daemon-reload
systemctl start xavi.service
systemctl enable xavi.service
```

### Create user

```sh
sudo useradd -m peter
sudo passwd griffin

# Add to groups
sudo usermod -aG sudo peter
sudo usermod -aG www-data peter
```

## Disks

### Check disk space

Overview (`/dev/sda1` is usually the main HD):

```sh
df -h
```

To analyze folders:

```sh
du -shc /var/*
```

### Repair and Mount HDDs via crontab

```sh
# Mount a drive on boot after 30 seconds
@reboot sleep 30 && sudo fsck -y /dev/sda1 && sudo mount /dev/sda1 /media/seagate1tb/
```

## Files

### Syncing files

Sync two directories (watch for the `*`!):

```sh
rsync -avP /media/xavi/Elements15A/* /media/xavi/Elements15B/
```

Get a file from remote to local:

```sh
scp root@60.60.60.60:/backups/backup-$(date '+%Y%m%d').tar.gz ~/backups/backup-$(date '+%Y%m%d').tar.gz
```

### File permissions

```sh
sudo chown -R www-data:www-data /var/www/example.com/
sudo chmod -R g+rwxs /var/www/example.com/
sudo chmod -R 755 /var/www/example.com
```

### Create a symlink

```
ln -s {source} {link}
# Example: ln -s /var/www/foo/bar ~/foobar
```

### Compress/Uncompress tar.gz

- `tar -czvf {filename}.tar.gz {directory}`: Compress
- `tar -xzvf {filename}.tar.gz`: Uncompress

## SSH

### Generate SSH Keys

```sh
sudo apt install -y openssh-client
cd ~
ssh-keygen
```

Or generate custom ones:

```sh
cd ~/.ssh/
ssh-keygen -t ed25519 -b 4096 -C "{xavi@workemail.com}" -f bitbucket_work
```

(do not enter a passphrase)

### Install SSH Key into server

```sh
ssh-copy-id username@remotehost
# or with a custom key
ssh-copy-id -i ~/.ssh/id_rsa.pub username@remotehost
```

### External SSH Keys management

```sh
# Remove existing key
ssh-keygen -f "~/.ssh/known_hosts" -R "bitbucket.org"

# Get key and add it
ssh-keygen -R bitbucket.org && curl https://bitbucket.org/site/ssh >> ~/.ssh/known_hosts

# Get info on current key
ssh git@bitbucket.org host_key_info
```

### Forward port

```sh
ssh -L 9090:localhost:8384 myserver.com
```

### SSHFS

Mount remote server as directory (instead of SFTP client)

```sh
sudo apt install sshfs
sudo mkdir /mnt/remotehost
ssh username@remotehost
sudo sshfs -o allow_other,default_permissions username@remotehost:/ /mnt/remotehost/
```

## Shortcuts

- `Ctrl+Alt+F2`: swap to another TTY
- `Ctrl+Alt+F1`: put you back into the normal desktop

## Networking

### Scan devices on same network

```sh
sudo apt install nmap
ifconfig
sudo nmap -sn 192.168.1.0/24
```

### Scan domain name for DNS records

```sh
dig -t txt salesforce.com
```

## Miscelaneous

### Schedule shutdown/suspend

```sh
# Shutdown in 30 minutes
sudo shutdown +30

# Suspend in 30 minutes
sleep 30m && systemctl suspend
```

### Play Windows games in Linux using Steam Proton

1. Add the installer to your Steam library with "Add a non-Steam to My Library"
2. Right click on the installer in your library and force the use of Proton
3. Click on the installer in your library and then click "Play". The installer should run.
4. Search your .steam folder for the game .exe
5. Open properties for the installer, and change the target to the .exe you found

Steam files can be found here in these paths in Debian/Ubuntu:

- Executable files: `/home/USER/.steam/debian-installation/steamapps/compatdata/ID/pfx/dosdevices/e:/Games/GAME`
- Saved games: `/home/USER/.steam/debian-installation/steamapps/compatdata/ID/pfx/drive_c/users/steamuser/Saved Games/GAME/users/ID`

### Download YT playlist as mp3 audio files

```
sudo apt install yt-dlp
yt-dlp --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" https://www.youtube.com/playlist?list=xxxxxxx
```

## Random fixes

### Fix Bluetooth connection failed

```sh
systemctl --user enable pulseaudio && systemctl --user start pulseaudio
```

### Fix Kernel issue

```sh
sudo apt remove linux-image-5.15.0-10058-tuxedo
sudo apt install linux-image-5.15.0-10058-tuxedo
```

### Fix KDE Connect not showing devices

```sh
sudo ufw allow 1714:1764/udp
sudo ufw allow 1714:1764/tcp
sudo ufw reload
```

## Apps

### Syncthing

Follow this tutorial to avoid the 'deprecated keys' issue:

https://www.linuxcapable.com/how-to-install-syncthing-on-ubuntu-linux/

- Config file: `nano ~/.local/state/syncthing/config.xml`
- Use these UFW rules:
  ```sh
  sudo ufw allow syncthing
  sudo ufw allow syncthing-gui
  ```

### NeoVim + NvChad

NvChad Releases: https://github.com/neovim/neovim/releases

```sh
wget https://github.com/neovim/neovim/releases/download/v0.9.0/nvim.appimage
alias vim=nvim
echo 'alias vim=nvim' >> .zshrc
echo 'alias vim=nvim' >> .zbashrc
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip
# install JetBrains Mono Medium Nerd Font Complete.ttf
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

### OCR text

```sh
sudo apt install ocrmypdf
sudo apt install tesseract-ocr-spa
ocrmypdf -l spa --sidecar output.txt input.pdf output.pdf
```
