# Raspberry Pi

`sudo raspi-config`


## SSH

Create a file called `ssh` in `boot` (root folder in SD).


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

`sudo nano /etc/wpa_supplicant/wpa_supplicant.conf`

```
network={
    ssid="thename"
    psk="thepassword"
}
```



## Thermal printer

```
sudo apt-get install python3 python3-setuptools python3-pip libjpeg8-dev
sudo pip3 install --upgrade pip
sudo pip3 install python-escpos
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
