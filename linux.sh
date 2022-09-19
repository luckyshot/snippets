# This is a list of commands I run on a freshly installed Ubuntu/Debian



sudo apt update
sudo apt -y upgrade

# install browser?
# install Visual Sudio Code
# install syncthing https://apt.syncthing.net/
# install dbeaver-ce https://dbeaver.io/download/
# install iriun webcam https://iriun.com/
# install teamviewer/anydesk/remote desktop
sudo apt install filezilla
sudo apt install qbittorrent

# Powermate
sudo add-apt-repository ppa:stefansundin/powermate
sudo apt-get update
sudo apt-get install powermate
powermate
# Extra settings: sudo nano /etc/powermate.toml

# Apache
sudo apt install -y apache2 apache2-utils
sudo systemctl enable apache2
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

# PHP 8
sudo apt install lsb-release ca-certificates apt-transport-https software-properties-common -y
sudo add-apt-repository ppa:ondrej/php
sudo apt install php8.0
sudo apt install php8.0-cli php8.0-common php8.0-imap php8.0-redis php8.0-snmp php8.0-xml php8.0-zip php8.0-mbstring

# Virtual hosts
cd /etc/apache2/sites-available/
sudo touch vhosts.conf
sudo a2dissite 000-default.conf
sudo a2ensite vhosts.conf
sudo service apache2 reload
sudo nano /etc/hosts

# Gaming
sudo apt install gamemode




# Now reboot
sudo reboot




