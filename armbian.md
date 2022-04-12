# Armbian

## ISO

Image for Banana Pi M2 Zero: https://armbian.hosthatch.com/archive/bananapim2zero/archive/

## Set up WiFi

`sudo nano /etc/wpa_supplicant/wpa_supplicant.conf`

```sh
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
  ssid="SECURE-WIFI"
  psk="Tuclave"
}
```


