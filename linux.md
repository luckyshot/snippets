# Linux


## General tweaks

```sh
# crontab -e
# Auto-update (only do this for non-critical infrastructure)
9 4 * * 1 sudo apt update -y && sudo apt upgrade -y
```

### Create user

```
sudo useradd -m peter
sudo passwd peter

# Add to sudo
usermod -aG sudo peter
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

### Mount HDDs via crontab

```sh
# Mount a drive on boot after 30 seconds
@reboot sleep 30 && sudo mount /dev/sda1 /media/seagate1tb/
```


## Files

## Syncing files

Sync two directories (watch for the `*`!):

```sh
rsync -avP /media/xavi/Elements15A/* /media/xavi/Elements15B/
```

### File permissions

```sh
sudo chown -R www-data:www-data /var/www/example.com
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

```
ssh-copy-id  username@remotehost
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


## Miscelaneous

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

## Syncthing

Follow this tutorial to avoid the 'deprecated keys' issue: 

https://www.linuxcapable.com/how-to-install-syncthing-on-ubuntu-linux/

- Config file: `nano ~/.local/state/syncthing/config.xml`
- Use these UFW rules:
  ```sh
  sudo ufw allow syncthing
  sudo ufw allow syncthing-gui
  ```

## NeoVim + NvChad

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
