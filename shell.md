# Shell

## Chown and permissions

```sh
sudo chown -R www-data:www-data /var/www/example.com/; sudo chmod -R g+rwxs /var/www/example.com/
```

### Create user

```sh
sudo useradd -m pettergriffin
sudo passwd pettegriffin

# if needed, add to sudoers group
adduser pettergriffin sudo
```

### Add to group

```sh
sudo usermod -a -G www-data petergriffin
```

### Set bash as default console/terminal command shell

`chsh`, enter password and type `/bin/bash`


## Aliases

```sh
nano ~/.bashrc

alias serveron="sudo service apache2 restart;sudo service mysql start"
alias ll="ls -la"
alias _u="sudo apt update;sudo apt upgrade"
```

`sudo nano /etc/apache2/sites-enabled/000-default.conf`



## Git and SSH keys

- `ls -al ~/.ssh`
- `ssh-keygen -t ed25519 -C "email@example.com"`
- `eval "$(ssh-agent -s)"`
- `nano ~/.ssh/config`

```sh
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```

- `ssh-add -K ~/.ssh/id_ed25519`
- `pbcopy < ~/.ssh/id_ed25519.pub`
- Paste the clipboard contents into Github (https://github.com/settings/keys) or whatever
- Do a first connection `ssh -T git@github.com` and add the RSA host key

If you are getting a `Permission denied (publickey). fatal: Could not read from remote repository. Please make sure you have the correct access rights and the repository exists.` error or similar, usually after a reboot, try running `ssh-add -K ~/.ssh/id_ed25519` again.



## Hetzner LAMP Ubuntu server initial setup (20.04)

In no particular order, things are repeated! careful!!

```sh
# Finish installing LetsEncrypt
certbot --apache


# Add your non-privileged user
useradd -m xavi
passwd xavi
usermod -a -G www-data xavi


# Swap file
# - Less than 2 GB RAM - 2x the RAM
# - 2 to 8 GB RAM - same size as RAM
# - More than 8 GB RAM - at least 4 GB
# Example for a 8GB swap file
fallocate -l 8G /swapfile
# for 2GB: `dd if=/dev/zero of=/swapfile bs=1024 count=2097152`
dd if=/dev/zero of=/swapfile bs=1024 count=8388608
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
nano /etc/fstab

##### Paste this #####
/etc/fstab
/swapfile swap swap defaults 0 0
###############################

sudo swapon --show
sudo free -h


# APT update and upgrade PHP, Apache
apt update
apt upgrade

add-apt-repository ppa:ondrej/php
add-apt-repository ppa:ondrej/apache2

apt purge php7.*

apt install git
apt install php8.0-fpm

service apache2 restart

apt install php8.0-common php8.0-mysql php8.0-xml php8.0-xmlrpc php8.0-curl php8.0-gd php8.0-imagick php8.0-cli php8.0-dev php8.0-imap php8.0-mbstring php8.0-opcache php8.0-soap php8.0-zip php8.0-intl -y

apt install php7.4-common php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd php7.4-imagick php7.4-cli php7.4-dev php7.4-imap php7.4-mbstring php7.4-opcache php7.4-soap php7.4-zip php7.4-intl -y


# To switch PHP version
sudo update-alternatives --set php /usr/bin/php7.4

service apache2 restart

a2dismod php8.0
apt install php8.0-fpm
a2enmod proxy_fcgi setenvif
a2enconf php8.0-fpm


# Upgrade Apache2

add-apt-repository ppa:ondrej/apache2
apt install apache2
apt update
apt upgrade

apt autoclean
apt autoremove

systemctl restart apache2

apache2 -v
php -v
mysql --version


# Create Apache .conf files and folders
nano /etc/apache2/sites-available/example.com.conf
a2ensite example.com.conf
systemctl reload apache2

mkdir /var/www/example.com
chown www-data:www-data example.com/
chmod -R g+rwxs example.com/


# Login to MySQL
cat /root/.hcloud_password
mysql -u root -p


sudo apt-get install php-mbstring

```


## Reverse SSH Tunnel

Based on https://www.howtogeek.com/428413/what-is-reverse-ssh-tunneling-and-how-to-use-it/

```sh
# On remote computer

# if SSH daemon not active, activate service on boot
sudo systemctl enable sshd

ssh -R 43022:localhost:22 dave@sulaco.local
# - 43022: where local is listening
# - localhost
# - 22: remote port where local will connect
# - dave@sulaco.local: account the remote computer will connect on local

# Enter password
# We’re now connected to local from remote

# On local computer
ssh pi@localhost -p 43022

```


## Access remote devices with tmate

https://tmate.io/

Download tmate officially (you need v2.4.0, not ready at the time of writing this):

`sudo apt-get install tmate`

Or unofficially (v2.4.0 ready):

```sh
curl -fsSL https://github.com/MaxPeal/tmate/raw/fork-with-get-tmate.sh/get-tmate.sh -o get-tmate.sh
sh get-tmate.sh
```

Check version: `./bin/tmate -V`

If no SSH keys generated yet: `ssh-keygen`

Get an API key from: https://tmate.io/#api_key

Get a random 50 char string from: https://xaviesteve.com/pro/tools.php#password-length=50|password

Set configuration parameters:

`nano ~/.tmate.conf`

```sh
set tmate-api-key "tmk-API_KEY"
# Max 50 chars
set tmate-session-name "RANDOM_STRING"
```

Alternatively, validate incoming clients with specific public keys: https://tmate.io/#access_control

Raspberry run on boot:

`nano /etc/xdg/lxsession/LXDE-pi/autostart`

```sh
@tmate -F
```

All done!

Now you can SSH into it by using:

```ssh YOUR_USERNAME/RANDOM_STRING@ssh.tmate.io```


### Scan devices on same network

`sudo apt install nmap`

`ifconfig`

`sudo nmap -sn 192.168.1.0/24`

