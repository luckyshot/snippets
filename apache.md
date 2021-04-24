# Apache

_These are the default paths, each server can (and usually should) be customized_

## OSX / Linux

`sudo apache2ctl -S`                              (tests config)
`sudo apachectl -k restart`
`sudo code /usr/local/etc/httpd/httpd.conf`
`sudo code /usr/local/etc/httpd/extra/httpd-vhosts.conf`
`sudo code /etc/hosts`
`code /usr/local/etc/php/7.4/php.ini`

ErrorLog "/usr/local/var/log/httpd/error_log"
ServerRoot "/usr/local/opt/httpd"


## Windows 10 (WSL)

`sudo nano /etc/apache2/apache2.conf`
`sudo nano /etc/apache2/sites-enabled/000-default.conf`

### Edit through Windows c:\Windows\System32\Drivers\etc\hosts

`sudo service mysql start`
`sudo service apache2 restart`



Hide server information from headers and error pages

`sudo nano /etc/apache2/apache2.conf` (Ubuntu)

`ServerSignature Off`

Configuration errors:

`sudo nano /var/log/apacge2/error.log`
