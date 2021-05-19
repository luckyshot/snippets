# Apache

_These are the default paths, each server can (and usually should) be customized_

## OSX / Linux

```
sudo apache2ctl -S                     (tests config)
sudo apachectl -k restart
sudo code /usr/local/etc/httpd/httpd.conf
sudo code /usr/local/etc/httpd/extra/httpd-vhosts.conf
sudo code /etc/hosts
code /usr/local/etc/php/7.4/php.ini
```

```
ErrorLog "/usr/local/var/log/httpd/error_log"
ServerRoot "/usr/local/opt/httpd"
```


## OSX / Linux (via brew)

Following these instructions: https://gist.github.com/karlhillx/5cd68430aeb25e5e242a3e2c30f238d1

And add to your path `echo 'export PATH="/usr/local/opt/php@8.0/bin:$PATH"' >> ~/.zshrc`

For MySQL do:

```yaml
brew doctor
brew update
brew install mysql
mysql.server start
brew services start mysql
mysql -u root -p
```

```SQL
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'youpassword';
```

Useful commands:

```
sudo apachectl start
sudo apachectl stop
sudo apachectl -k restart
sudo apachectl configtest

nano /usr/local/etc/php/7.x/php.ini

nano /usr/local/etc/httpd/httpd.conf
nano /usr/local/etc/httpd/extra/httpd-vhosts.conf
```


## Windows 10 (WSL Ubuntu)

```
sudo nano /etc/apache2/apache2.conf
sudo nano /etc/apache2/sites-enabled/000-default.conf
sudo nano /etc/php/7.4/apache2/php.ini
```

### Edit through Windows c:\Windows\System32\Drivers\etc\hosts

```
sudo service mysql start
sudo service apache2 restart
```



Hide server information from headers and error pages

`sudo nano /etc/apache2/apache2.conf` (Ubuntu)

`ServerSignature Off`

Configuration errors:

`sudo grc tail -f /var/log/apache2/error.log`


### Installing Apache/PHP

```BASH
sudo add-apt-repository ppa:ondrej/apache2
sudo add-apt-repository ppa:ondrej/php
sudo apt install ca-certificates apt-transport-https software-properties-common
sudo apt install php8.0 libapache2-mod-php8.0 php8.0-mysql
sudo apt update
php -v
```


## Performance

### Access log

```BASH
sudo grc tail -f /var/log/apache2/example.com-access.log
sudo grc tail -f /var/log/apache2/other_vhosts_access.log

tail -f /var/www/example.com/storage/logs/lastcommand.log
```
