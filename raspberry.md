# Raspberry Pi

`sudo raspi-config`


## SSH

Create a file called `ssh` in `boot` (root folder in SD).


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

Find idVendor and idProduct with command `lsusb` (use `lsusb -v` if you're having trouble finding it).

`nano thermal.py`

```
from escpos.printer import Usb

""" Seiko Epson Corp. Receipt Printer (EPSON TM-T88III) """
p = Usb(0x04b8, 0x0202, 0, profile="TM-T88III")
p.text("Hello World\n")
p.image("logo.gif")
p.barcode('1324354657687', 'EAN13', 64, 2, '', '')
p.cut()
```


`sudo python3 thermal.py`








Setup udev for USB-Printers
Get the Product ID and Vendor ID from the lsusb command # lsusb  Bus 002 Device 001: ID 1a2b:1a2b Device name

Create a udev rule to let users belonging to dialout group use the printer. You can create the file /etc/udev/rules.d/99-escpos.rules and add the following: SUBSYSTEM=="usb", ATTRS{idVendor}=="1a2b", ATTRS{idProduct}=="1a2b", MODE="0664", GROUP="dialout" Replace idVendor and idProduct hex numbers with the ones that you got from the previous step. Note that you can either, add yourself to “dialout” group, or use another group you already belongs instead “dialout” and set it in the GROUP parameter in the above rule.

Restart udev # sudo service udev restart In some new systems it is done with # sudo udevadm control --reload




https://python-escpos.readthedocs.io/en/latest/user/methods.html
