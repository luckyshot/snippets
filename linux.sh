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
sudo apt install ufw
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw enable
sudo ufw deny from 91.109.117.228
sudo ufw status

# set up KDE Connect
# install espanso
# install netdata
# install browser?
# install Visual Sudio Code
# install syncthing https://apt.syncthing.net/
# install TablePlus or DBeaver-CE https://dbeaver.io/download/
# install iriun webcam https://iriun.com/
# install teamviewer/anydesk/remote desktop
# gaming PC? https://gitlab.com/corectrl/corectrl
sudo apt install filezilla
sudo apt install qbittorrent

# Griffin PowerMate (you don't need this, it's a gadget I bought a long time ago and use it as a volume slider for my desktop computer + click to sleep)
sudo add-apt-repository ppa:stefansundin/powermate
sudo apt-get update
sudo apt-get install powermate
powermate
# Extra settings: sudo nano /etc/powermate.toml

# Battery saving
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

# Apache
sudo apt install -y apache2 apache2-utils composer curl
sudo systemctl enable apache2
sudo ln -s ~/Dropbox/WWW/ /var/www/WWW
sudo chown www-data:www-data /var/www/ -R

# Add user to www-data and vice-versa
sudo usermod -a -G www-data xavi
sudo usermod -a -G xavi www-data

sudo chown -R $USER:www-data /var/www/

# MariaDB
sudo nano /etc/apache2/conf-available/servername.conf
sudo apt install mariadb-server mariadb-client
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo mysql_secure_installation
sudo service apache2 reload

# set MariaDB root password
sudo mysql
# ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING PASSWORD('root');

# PHP 8
sudo apt install lsb-release ca-certificates apt-transport-https software-properties-common -y
sudo add-apt-repository ppa:ondrej/php
sudo apt install php8.1 php8.1-cli php8.1-common php8.1-imap php8.1-redis php8.1-snmp php8.1-xml php8.1-zip php8.1-mbstring php8.1-mysql php8.1-curl
# find more extensions via `apt search php- | less

sudo a2enmod rewrite

# install composer https://getcomposer.org/download/
# sudo mv composer.phar /usr/local/bin/composer

# install deployer https://deployer.org/docs/7.x/installation
# remember to create the alias

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
