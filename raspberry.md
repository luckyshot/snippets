# Raspberry Pi

`sudo raspi-config`


## Configure Wi-Fi


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

