# Linux

## Install SSH Key into server

```
ssh-copy-id  username@remotehost
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
