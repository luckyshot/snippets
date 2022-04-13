# Armbian

## Banana Pi M2 Zero

You will need a WiFi antenna (unless you're <1m from the router), you can go with anything that uses an IPX connector, for example, a PCB antenna that comes with other kits (MAIX Sipeed 20).

### ISO image

Image for Banana Pi M2 Zero: https://armbian.hosthatch.com/archive/bananapim2zero/archive/

## Set up WiFi

`sudo armbian-config`

#### Manually

`sudo nano /etc/wpa_supplicant/wpa_supplicant.conf`

```sh
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
  ssid="SECURE-WIFI"
  psk="Tuclave"
}
```


