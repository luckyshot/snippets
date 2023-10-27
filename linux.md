# Linux

## File permissions

```
sudo chown -R www-data:www-data /var/www/example.com
sudo chmod -R 755 /var/www/example.com
```

## Check disk space

Overview (`/dev/sda1` is usually the main HD):

```sh
df -h
```

To analyze folders:

```
du -shc /var/*
```


## SSH


### Generate SSH Keys

```
sudo apt install -y openssh-client
cd ~
ssh-keygen
```

Or generate custom ones:

```
cd ~/.ssh/
ssh-keygen -t ed25519 -b 4096 -C "{xavi@workemail.com}" -f bitbucket_work
```

(do not enter a passphrase)


### Install SSH Key into server

```
ssh-copy-id  username@remotehost
```

### External SSH Keys management

```
# Remove existing key
ssh-keygen -f "~/.ssh/known_hosts" -R "bitbucket.org"

# Get key and add it
ssh-keygen -R bitbucket.org && curl https://bitbucket.org/site/ssh >> ~/.ssh/known_hosts
 
# Get info on current key
ssh git@bitbucket.org host_key_info
```


## SSHFS

Mount remote server as directory (instead of SFTP client)

```
sudo apt install sshfs
sudo mkdir /mnt/remotehost
ssh username@remotehost
sudo sshfs -o allow_other,default_permissions username@remotehost:/ /mnt/remotehost/
```


## Create a symlink

```
ln -s {source} {link}
# Example: ln -s /var/www/foo/bar ~/foobar
```

## Compress/Uncompress tar.gz

- `tar -czvf {filename}.tar.gz {directory}`: Compress
- `tar -xzvf {filename}.tar.gz`: Uncompress

## Shortcut

- `Ctrl+Alt+F2`: swap to another TTY
- `Ctrl+Alt+F1`: put you back into the normal desktop

## Auto-mount external disk on boot

```
# Get disk UUID
ls -al /dev/disk/by-uuid/

# Get user and group ID
id YOURUSERNAME

# Get file format
lsblk -f

sudo nano /etc/fstab

# Put all together
UUID=628B-1CD8  /media/mydisk  exfat   defaults,uid=1000,gid=1001 0 0


# Save and check for errors
findmnt --verify
```

## Download YT playlist as mp3 audio files

```
sudo apt install yt-dlp
yt-dlp --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" https://www.youtube.com/playlist?list=xxxxxxx
```

## Create user

```
sudo useradd -m peter
sudo passwd peter

# Add to sudo
usermod -aG sudo peter
```


## Fix Kernel issue

```
sudo apt remove linux-image-5.15.0-10058-tuxedo
sudo apt install linux-image-5.15.0-10058-tuxedo
```


## NeoVim + NvChad

NvChad Releases: https://github.com/neovim/neovim/releases

```
wget https://github.com/neovim/neovim/releases/download/v0.9.0/nvim.appimage
alias vim=nvim
echo 'alias vim=nvim' >> .zshrc
echo 'alias vim=nvim' >> .zbashrc
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip
# install JetBrains Mono Medium Nerd Font Complete.ttf
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim


```
