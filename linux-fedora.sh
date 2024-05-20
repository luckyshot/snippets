
## PHP
sudo dnf install https://rpms.remirepo.net/fedora/remi-release-40.rpm
sudo yum update
sudo dnf module reset php
sudo dnf module install php:remi-8.2
php -v

## Apache

sudo dnf update -y
sudo dnf install httpd -y
rpm -qi httpd
systemctl start httpd
systemctl enable httpd
nano /etc/httpd/conf.d/vhosts.conf
sudo nano /etc/httpd/conf.d/vhosts.conf
systemctl restart httpd
sudo nano /etc/hosts
# sudo usermod -a -G <group> <user>
