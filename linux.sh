# This is a list of commands I run on a freshly installed Ubuntu/Debian
# NOTE: It is not meant to be ran as a .sh file, but to copy/paste each line separately

# =======================
# ====== Must-haves =====
# =======================

sudo apt update && sudo apt upgrade -y

# Make Downloads folders
mkdir ~/Downloads/Temp
mkdir ~/Downloads/Keep

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
sudo apt install software-properties-common apt-transport-https wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update && sudo apt install code -y

# 🔵 KDE Connect
sudo apt install kdeconnect
sudo ufw allow 1714:1764/udp
sudo ufw allow 1714:1764/tcp

# 🔵 Espanso
cd ~/Downloads/Temp
wget https://github.com/federico-terzi/espanso/releases/download/v2.2.1/espanso-debian-x11-amd64.deb
sudo apt install ./espanso-debian-x11-amd64.deb
espanso service register
espanso edit
# Then paste these: https://gist.github.com/luckyshot/0cc362020d55efa6d4d9a297ec9a61b5

# 🔵 DBeaver-CE https://dbeaver.io/download/
# 🔵 Iriun Webcam https://iriun.com/
# 🔵 Remote Desktop (MeshCentral, RustDesk, TeamViewer, AnyDesk...)
#    - RustDesk https://github.com/rustdesk/rustdesk/releases

# 🔵 FileZilla, qBittorrent
sudo apt install filezilla qbittorrent


# =================================
# ====== Software Development =====
# =================================

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

# 🔵 PHP 8
sudo apt install lsb-release ca-certificates apt-transport-https software-properties-common -y
sudo add-apt-repository ppa:ondrej/php
sudo apt install php8.1 php8.1-cli php8.1-common php8.1-imap php8.1-redis php8.1-snmp php8.1-xml php8.1-zip php8.1-mbstring php8.1-mysql php8.1-curl
# find more extensions via `apt search php- | less

sudo a2enmod rewrite

# 🔵 Amazon Web Services CLI
sudo apt install awscli
aws configure
# https://us-east-1.console.aws.amazon.com/iam/home?region=eu-west-1#/users
# - AWS Access Key ID
# - AWS Secret Access Key
# - Default region name: eu-west-1
# - Default output format
## List: aws s3 ls s3://bucketname/
## Download: aws s3 cp s3://bucketname/file.txt file.txt

# 🔵 Composer 
# https://getcomposer.org/download/
# sudo mv composer.phar /usr/local/bin/composer

# 🔵 Deployer
# https://deployer.org/docs/7.x/installation
# remember to create the alias

# Virtual hosts
cd /etc/apache2/sites-available/
sudo nano vhosts.conf
sudo a2dissite 000-default.conf
sudo a2ensite vhosts.conf
sudo service apache2 reload
sudo nano /etc/hosts


# ====================
# ====== Laptops =====
# ====================

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


# ===================
# ====== Gaming =====
# ===================

# 🔵 GameMode
sudo apt install gamemode

# 🔵 CoreCtrl (control with ease your computer hardware using application profiles)
# https://gitlab.com/corectrl/corectrl


# ===========================
# ====== Other software =====
# ===========================

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


# ========================
# ====== Final Steps =====
# ========================

# Clean up and reboot
sudo apt autoremove
sudo reboot
