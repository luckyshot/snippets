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

sudo pacman -S nano firefox code qbittorrent

# 🔵 Syncthing
sudo pacman -S syncthing
systemctl start syncthing.service --user
systemctl enable syncthing.service --user

# 🔵 Macro pad
# See https://xaviesteve.com/7047/setup-macropad-aliexpress-linux/
sudo pacman -S xbindkeys
xbindkeys --defaults > ~/.xbindkeysrc
nano ~/.xbindkeysrc
