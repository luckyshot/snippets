# This is a list of commands I run on a freshly installed Ubuntu/Debian
# NOTE: It is not meant to be ran as a .sh file, but to copy/paste each line separately



# =======================================================


# =======================================================
# 🟨 Must-haves
# =======================================================

sudo pacman -Syu

ssh-keygen -t rsa

# Avoid destroying your crontab by asking for confirmation
echo "alias crontab=\"crontab -i\"" >> .bashrc

# Must-have packages (ordered alphabetically)
sudo pacman -S nano code firefox git qbittorrent spectacle unrar

# 🔵 Syncthing
sudo pacman -S syncthing
systemctl start syncthing.service --user
systemctl enable syncthing.service --user

# 🔵 Rustdesk
wget https://github.com/rustdesk/rustdesk/releases/download/1.3.5/rustdesk-1.3.5-0-x86_64.pkg.tar.zst
sudo pacman -U ./rustdesk-1.3.5-0-x86_64.pkg.tar.zst

# 🔵 Macro pad
# See https://xaviesteve.com/7047/setup-macropad-aliexpress-linux/
sudo pacman -S xbindkeys
xbindkeys --defaults > ~/.xbindkeysrc
nano ~/.xbindkeysrc
xbindkeys
# killall -HUP xbindkeys; xbindkeys

# 🔵 Backblaze B2 backups
sudo pacman -S rclone
rclone config
# Get keys here https://secure.backblaze.com/app_keys.htm
# list all buckets (keep the : at the end)
rclone lsd NAMEOFREMOTEBACKUP: 
# list a bucket
rclone ls NAMEOFREMOTEBACKUP:NAMEOFREMOTEBUCKET 
# mount it in Linux
rclone mount NAMEOFREMOTEBACKUP:NAMEOFREMOTEBUCKET /PATH/TO/MOUNT --vfs-cache-mode writes 

# =======================================================
# 🟨 Gaming
# =======================================================

# 🔵 Steam
sudo pacman -S steam
# Select vulkan-radeon for AMD

# 🔵 Gamemode
sudo pacman -S gamemode
sudo usermod -aG gamemode $(whoami)
# Enable features: https://wiki.archlinux.org/title/GameMode
# Change run commands in Steam with `gamemoderun %command%`
