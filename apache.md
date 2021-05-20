# Apache

_Using my default paths, your server may be different_


## HTTP codes

- 100 Continue
- 101 Switching Protocol
- 102 Processing (WebDAV)
- 103 Early Hints
- 200 OK
- 201 Created
- 202 Accepted
- 203 Non-Authoritative Information
- 204 No Content
- 205 Reset Content
- 206 Partial Content
- 207 Multi-Status (WebDAV)
- 208 Already Reported (WebDAV)
- 226 IM Used (HTTP Delta encoding)
- 300 Multiple Choice
- 301 Moved Permanently
- 302 Found
- 303 See Other
- 304 Not Modified
- 305 Use Proxy 
- 306 unused
- 307 Temporary Redirect
- 308 Permanent Redirect
- 400 Bad Request
- 401 Unauthorized
- 402 Payment Required 
- 403 Forbidden
- 404 Not Found
- 405 Method Not Allowed
- 406 Not Acceptable
- 407 Proxy Authentication Required
- 408 Request Timeout
- 409 Conflict
- 410 Gone
- 411 Length Required
- 412 Precondition Failed
- 413 Payload Too Large
- 414 URI Too Long
- 415 Unsupported Media Type
- 416 Range Not Satisfiable
- 417 Expectation Failed
- 418 I'm a teapot
- 421 Misdirected Request
- 422 Unprocessable Entity (WebDAV)
- 423 Locked (WebDAV)
- 424 Failed Dependency (WebDAV)
- 425 Too Early 
- 426 Upgrade Required
- 428 Precondition Required
- 429 Too Many Requests
- 431 Request Header Fields Too Large
- 451 Unavailable For Legal Reasons
- 500 Internal Server Error
- 501 Not Implemented
- 502 Bad Gateway
- 503 Service Unavailable
- 504 Gateway Timeout
- 505 HTTP Version Not Supported
- 506 Variant Also Negotiates
- 507 Insufficient Storage (WebDAV)
- 508 Loop Detected (WebDAV)
- 510 Not Extended
- 511 Network Authentication Required

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
