# This is a list of commands I run on a freshly installed Ubuntu/Debian
# NOTE: It is not meant to be ran as a .sh file, but to copy/paste each line separately

# Make Downloads folders
mkdir ~/Downloads/Temp
mkdir ~/Downloads/Keep

sudo apt update
sudo apt -y upgrade

sudo apt-get install nodejs
sudo apt install npm

sudo apt install fail2ban

# set up KDE Connect
# install espanso
# install netdata
# install browser?
# install Visual Sudio Code
# install syncthing https://apt.syncthing.net/
# install TablePlus or DBeaver-CE https://dbeaver.io/download/
# install iriun webcam https://iriun.com/
# install teamviewer/anydesk/remote desktop
sudo apt install filezilla
sudo apt install qbittorrent

# Griffin PowerMate (you don't need this, it's a gadget I bought a long time ago and use it as a volume slider for my desktop computer + click to sleep)
sudo add-apt-repository ppa:stefansundin/powermate
sudo apt-get update
sudo apt-get install powermate
powermate
# Extra settings: sudo nano /etc/powermate.toml

# Apache
sudo apt install -y apache2 apache2-utils
sudo systemctl enable apache2
sudo ln -s ~/Dropbox/WWW/ /var/www/WWW
sudo chown www-data:www-data /var/www/ -R

# Add user to www-data and vice-versa
sudo usermod -a -G www-data xavi
sudo usermod -a -G xavi www-data

# MariaDB
sudo nano /etc/apache2/conf-available/servername.conf
sudo apt install mariadb-server mariadb-client
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo mysql_secure_installation
sudo service apache2 reload

# PHP 8
sudo apt install lsb-release ca-certificates apt-transport-https software-properties-common -y
sudo add-apt-repository ppa:ondrej/php
sudo apt install php8.0
sudo apt install php8.0-cli php8.0-common php8.0-imap php8.0-redis php8.0-snmp php8.0-xml php8.0-zip php8.0-mbstring php8.0-mysql
# find more extensions via `apt search php- | less`
sudo service apache2 reload

# Virtual hosts
cd /etc/apache2/sites-available/
sudo touch vhosts.conf
sudo a2dissite 000-default.conf
sudo a2ensite vhosts.conf
sudo service apache2 reload
sudo nano /etc/hosts

# Gaming
sudo apt install gamemode




# Clean up and reboot
sudo apt autoremove
sudo reboot



