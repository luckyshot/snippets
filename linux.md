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
ls -al /dev/disk/by-uuid/
# Copy UUID

lsblk -f
# Copy file format

sudo nano /etc/fstab

# Paste it
UUID=628B-1CD8  /media/mydisk  exfat   defaults 0 0

# Save and check for errors
findmnt --verify
```

## Download YT playlist as mp3 audio files

```
sudo apt install yt-dlp
yt-dlp --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" https://www.youtube.com/playlist?list=xxxxxxx
```


