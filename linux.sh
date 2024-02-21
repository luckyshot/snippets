# This is a list of commands I run on a freshly installed Ubuntu/Debian
# NOTE: It is not meant to be ran as a .sh file, but to copy/paste each line separately

# Make Downloads folders
mkdir ~/Downloads/Temp
mkdir ~/Downloads/Keep

sudo apt update
sudo apt upgrade -y

sudo apt install openssh-server fail2ban ufw
sudo apt install npx nodejs

sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw enable
sudo ufw deny from 91.109.117.228
sudo ufw status

# install syncthing https://www.linuxcapable.com/how-to-install-syncthing-on-ubuntu-linux/

# set up KDE Connect

# install espanso
cd ~/Downloads/Temp
wget https://github.com/federico-terzi/espanso/releases/download/v2.2.1/espanso-debian-x11-amd64.deb
sudo apt install ./espanso-debian-x11-amd64.deb
espanso service register

# install netdata?
# install Firefox
# install Visual Sudio Code
# install DBeaver-CE https://dbeaver.io/download/
# install iriun webcam https://iriun.com/
# install remote desktop (meshcentral, rustdesk, teamviewer, anydesk...)
# install rustdesk https://github.com/rustdesk/rustdesk/releases

# gaming PC? https://gitlab.com/corectrl/corectrl
sudo apt install filezilla qbittorrent

# Griffin PowerMate (you don't need this, it's a gadget I bought a long time ago and use it as a volume slider for my desktop computer + click to sleep)
# Ubuntu
sudo add-apt-repository ppa:stefansundin/powermate
# Debian
echo 'deb http://ppa.launchpad.net/stefansundin/powermate/ubuntu focal main' | sudo tee /etc/apt/sources.list.d/powermate.list && sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0xFFE1FFFFAFEC55BB
sudo apt update
sudo apt install powermate
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
# sudo nano /etc/apache2/conf-available/servername.conf
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
sudo nano vhosts.conf
sudo a2dissite 000-default.conf
sudo a2ensite vhosts.conf
sudo service apache2 reload
sudo nano /etc/hosts

# Gaming
sudo apt install gamemode




# Clean up and reboot
sudo apt autoremove
sudo reboot
