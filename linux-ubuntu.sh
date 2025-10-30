# This is a list of commands I run on a freshly installed Ubuntu/Debian
# NOTE: It is not meant to be ran as a .sh file, but to copy/paste each line separately

# =======================================================
# 🟥 Backup former setup files
# =======================================================
zip -r ~/Desktop/home-share.backup.zip ~/.local
zip -r ~/Desktop/home-config.backup.zip ~/.config
# =======================================================


# =======================================================


# =======================================================
# 🟨 Must-haves
# =======================================================

sudo apt update && sudo apt upgrade -y
sudo ubuntu-drivers autoinstall

ssh-keygen -t rsa

# Avoid destroying your crontab by asking for confirmation
echo "alias crontab=\"crontab -i\"" >> .bashrc

sudo apt install htop lm-sensors
sudo sensors-detect
# Press ENTER until done for recommended settings
watch sensors

# Make Downloads folders
mkdir ~/Downloads/Temp

# 🔵 SSH, Fail2Ban and UFW
sudo apt install openssh-server fail2ban ufw
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw enable
sudo ufw status
#sudo ufw deny from 91.109.117.228

# 🔵 Syncthing
# https://www.linuxcapable.com/how-to-install-syncthing-on-ubuntu-linux/
sudo apt install software-properties-common apt-transport-https wget curl -y
sudo curl -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt update && sudo apt install syncthing -y
syncthing --version
sudo systemctl enable syncthing@xavi.service
sudo systemctl start syncthing@xavi.service
sudo ufw allow syncthing

# 🔵 Visual Sudio Code
# NOTE: Or install VS Codium (non-Microsoft binaries)
sudo apt install software-properties-common apt-transport-https wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update && sudo apt install code -y

# 🔵 WireGuard VPN
# [...]

# 🔵 KDE Connect
sudo apt install kdeconnect
sudo ufw allow 1714:1764/udp
sudo ufw allow 1714:1764/tcp

# 🔵 Espanso
cd ~/Downloads/Temp
wget https://github.com/federico-terzi/espanso/releases/download/v2.2.1/espanso-debian-wayland-amd64.deb
sudo apt install ./espanso-debian-wayland-amd64.deb
espanso service register
espanso edit
# Then paste these: https://gist.github.com/luckyshot/0cc362020d55efa6d4d9a297ec9a61b5

# 🔵 ZSH
# 🔵 Firefox
# 🔵 Github Desktop https://github.com/shiftkey/desktop/releases
# 🔵 Cheese
# 🔵 Redshift
# 🔵 VLC Player
# 🔵 DBeaver-CE https://dbeaver.io/download/
# 🔵 Iriun Webcam https://iriun.com/
# 🔵 Remote Desktop (MeshCentral, RustDesk, TeamViewer, AnyDesk...)
#    - RustDesk https://github.com/rustdesk/rustdesk/releases
# 🔵 OBS Studio

# 🔵 FileZilla, qBittorrent
sudo apt install filezilla qbittorrent

# 🔵 RadioTray-NG
# https://github.com/ebruck/radiotray-ng/releases


# =======================================================
# 🟨  Software Development
# =======================================================

# 🔵 Node
sudo apt install npx nodejs

# 🔵 Apache
sudo apt install -y apache2 apache2-utils composer curl
sudo systemctl enable apache2
sudo ln -s ~/Dropbox/WWW/ /var/www/WWW
sudo chown www-data:www-data /var/www/ -R
# Add user to www-data and vice-versa
sudo usermod -a -G www-data xavi
sudo usermod -a -G xavi www-data

sudo chown -R $USER:www-data /var/www/

sudo a2enmod rewrite
sudo systemctl restart apache2

# XDebug
sudo apt update
sudo apt install -y php-xdebug php8.3-xdebug



# 🔵 Virtual hosts
cd /etc/apache2/sites-available/
sudo nano vhosts.conf
sudo a2dissite 000-default.conf
sudo a2ensite vhosts.conf
sudo service apache2 reload
sudo nano /etc/hosts


# 🔵 PHP 8
sudo apt install lsb-release ca-certificates apt-transport-https software-properties-common -y
sudo add-apt-repository ppa:ondrej/php
sudo apt install php8.3 php8.3-cli php8.3-common php8.3-imap php8.3-redis php8.3-snmp php8.3-xml php8.3-zip php8.3-mbstring php8.3-mysql php8.3-curl

## Find more extensions via `apt search php- | less

## Change version: 
##   sudo update-alternatives --config php
##   sudo update-alternatives --config phar


# 🔵 MariaDB
# sudo nano /etc/apache2/conf-available/servername.conf
sudo apt install mariadb-server mariadb-client
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo mysql_secure_installation
sudo service apache2 reload
# set root password
sudo mysql
# ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING PASSWORD('root');


# 🔵 Amazon Web Services CLI
sudo apt install awscli
aws configure
# https://us-east-1.console.aws.amazon.com/iam/home?region=eu-west-1#/users
# - AWS Access Key ID
# - AWS Secret Access Key
# - Default region name: eu-west-1
# - Default output format
## List: aws s3 ls s3://bucketname/
## Download file: aws s3 cp s3://bucketname/file.txt file.txt
## Download folder: aws s3 cp --recursive s3://bucketname/dir localdir

# 🔵 Composer 
# https://getcomposer.org/download/
# sudo mv composer.phar /usr/local/bin/composer

# 🔵 Deployer
# https://deployer.org/docs/7.x/installation
# remember to create the alias


# =======================================================
# 🟨 Laptop
# =======================================================

# 🔵 Battery saving
sudo add-apt-repository ppa:linrunner/tlp
sudo apt update
sudo apt install tlp tlp-rdw
sudo tlp start
tlp-stat -s
sudo systemctl enable tlp.service
tlp-stat -s
sudo nvim /etc/tlp.conf
sudo powertop
sudo add-apt-repository ppa:slimbook/slimbook
sudo apt update
sudo apt install slimbookbattery


# =======================================================
# 🟨 Gaming
# =======================================================

# 🔵 Steam
# Steam
# Protontricks
# Lutris

# 🔵 GameMode
sudo apt install gamemode

# 🔵 CoreCtrl (control with ease your computer hardware using application profiles)
# https://gitlab.com/corectrl/corectrl


# =======================================================
# 🟨 Other software
# =======================================================

# 🔵 Netdata

# 🔵 Griffin PowerMate (you don't need this, it's a gadget I bought a long time ago and use it as a volume slider for my desktop computer + click to sleep)
# Ubuntu
sudo add-apt-repository ppa:stefansundin/powermate
# Debian
echo 'deb http://ppa.launchpad.net/stefansundin/powermate/ubuntu focal main' | sudo tee /etc/apt/sources.list.d/powermate.list && sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0xFFE1FFFFAFEC55BB
sudo apt update
sudo apt install powermate
powermate
# Extra settings: sudo nano /etc/powermate.toml


# =======================================================
# 🟨 Final Steps
# =======================================================

# Clean up and reboot
sudo apt autoremove
sudo reboot
