# Raspberry Pi

# Images

https://www.raspberrypi.com/software/operating-systems/


# Config

`sudo raspi-config`


## Enable SSH

Create a file called `ssh` in `boot` (root folder in SD).


## Change hostname

```sh
sudo nano /etc/hostname
sudo nano /etc/hosts
sudo reboot
```

## Change default password ('raspberry')

`passwd`


## Static IP

`sudo nano /etc/dhcpcd.conf`

```sh
# STATIC IP
interface wlan0
static ip_address=192.168.1.106/24
static routers=192.168.1.1
static domain_name_servers=1.1.1.1 1.0.0.1
```




## Install Cockpit

`sudo apt install cockpit`


## GPIO pins

![GPIO_fan_connection](https://user-images.githubusercontent.com/141241/136574270-7e676a79-7466-499d-b393-4f756fc78156.jpeg)

![image](https://user-images.githubusercontent.com/141241/198149694-241a2497-466b-4d44-8bca-5a628aad4af0.png)



`sudo tail -f /var/log/syslog`

## Encoding issues

`sudo raspi-config`

`Localization Options` > `Locale`

Choose `en_US UTF8` and also any language you are using (i.e. `es_ES UTF-8`)


## Wi-Fi

### Initial setup

Create `wpa_supplicant.conf` in `boot` (root folder in SD).

```
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=ES

network={
 ssid="thename"
 psk="thepassword"
}
```


### After setup

NOTE: IP will be different than Ethernet connection!

`sudo nano /etc/wpa_supplicant/wpa_supplicant.conf`

```
network={
    ssid="thename"
    psk="thepassword"
}
```

`wpa_cli -i wlan0 reconfigure`


## Thermal printer

```
sudo apt-get install python3 python3-setuptools python3-pip libjpeg8-dev
sudo pip3 install --upgrade pip
sudo pip3 install python-escpos==3.0a7
```

Find idVendor and idProduct (they're like `04b8:0202` with command `lsusb` (use `lsusb -v` if you're having trouble finding it).

`nano thermal.py`

```
from escpos.printer import Usb

""" Seiko Epson Corp. Receipt Printer (EPSON TM-T88III) """
p = Usb(0x04b8, 0x0202, 0)
p.text("Hello World\n")
p.image("logo.gif")
p.barcode('1324354657687', 'EAN13', 64, 2, '', '')
p.cut()
```

Before saving, replace the idVendor and idProduct in `0x04b8, 0x0202` with your `04b8:0202`.

`sudo python3 thermal.py`


Create the file `/etc/udev/rules.d/99-escpos.rules` and add the following: 

`SUBSYSTEM=="usb", ATTRS{idVendor}=="1a2b", ATTRS{idProduct}=="1a2b", MODE="0664", GROUP="dialout"`

Replace `idVendor` and `idProduct` hex numbers with the ones that you got.

`sudo service udev restart` (or if it doesn't work `sudo udevadm control --reload`)

Full docs: https://python-escpos.readthedocs.io/en/latest/user/methods.html


## Temperature (in Celsius)

`/opt/vc/bin/vcgencmd measure_temp`
