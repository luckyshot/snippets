
## PHP
sudo dnf install https://rpms.remirepo.net/fedora/remi-release-40.rpm
sudo yum update
sudo dnf module reset php
sudo dnf module install php:remi-8.2
php -v

