# Linux Terminal

This document outlines the configuration tweaks needed to go full-terminal on a work laptop/computer. The motivation for this is to increase productivity and creativity by removing distractions and having a clean, simple and minimal workspace that also saves tons of battery life whenever you're out and about.

## Checklist

As a functional work station we need, at a minimum:

_(✅: Scripted; 🟨: Pending; 🤚 Manually done following some steps)_

- ✅ Window toggle/switcher/splitter (`tmux`)
- ✅ Text Editor/IDE (`micro`)
  - 🟨 Move to neovim some day
- ✅ Web Browser (`w3m`)
- ✅ Syncthing
- ✅ System information
  - ✅ Battery level (`tmux plugin`)
  - ✅ Clock (`tmux`)
- ✅ WiFi management (`nmtui`)
- ✅ Music & Video player (`mpv`)
  - 🟨 Can't hear sounds on full console mode though, is it even possible?
- 🤚 Boot from console
- ✅ Aliases 
  - ✅ Load graphical interface (`sudo startx`)
  - ✅ `lll`: `ls -lah`
  - ✅ `m`: Micro shortcut
- ✅ Mouse support (`gpm`)
  - 🟨 Compatibility with micro+w3m
- 🟨 Controls
  - 🟨 Volume
  - ✅ Screen brightness
  - ✅ Keyboard brightness


## Shortcuts

Keyboard shortcuts that you will need to learn:

- **tmux**
  - Pane splitting
    - `Ctrl+B %`: Split horizontally
    - `Ctrl+B "`: Split vertically
    - `Ctrl+B Arrow`: focus to another pane
    - `Ctrl+D`: close focused pane
  - Windows
    - `Ctrl+B c`: new window
    - `Ctrl+B p`: go to previous window
    - `Ctrl+B 0-9`: go to window N
  - Sessions
    - _to do_
- **w3m**
  - `Shift+Q`: quit
  - `Shift+B`: go back
  - `Shift+T`: new tab
  - `Shift+U`: new URL
- **micro**
- **mpv**
  - Command `mpv {filename}`
  - `9` `0`: Volume down/up 
- **Graphical interface**
  - Type command `sudo startx`
  - `Ctrl+Alt+F1`-`F6`: switch between sessions
  - `Ctrl+Alt+F7`: switch to graphical session
- **WiFi**
  - Command `nmtui`
- **Brightness**
  - Command `bright1`: Increase screen brightness by 10%
  - Command `bright0`: Decrease screen brightness by 10%
  - Command `kbd1`: Turn keyboard light on
  - Command `kbd0`: Turn keyboard light off
  

## Installation

1. Install OS with a graphical interface
2. Run these commands carefully one by one (it's not yet ready to simply run as-is)

```sh
cd ~

# Download this file for reference
curl https://raw.githubusercontent.com/luckyshot/snippets/main/linux-terminal.md >> ~/linux-terminal.md


# Install tmux
echo 'Install tmux'
sudo apt install -y tmux

## Install tmux Plugin Manager (https://github.com/tmux-plugins/tpm)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "# List of plugins" >> ~/.tmux.conf
echo "set -g @plugin 'tmux-plugins/tpm'" >> ~/.tmux.conf
echo "set -g @plugin 'tmux-plugins/tmux-sensible'" >> ~/.tmux.conf
echo "set -g @plugin 'tmux-plugins/tmux-battery'" >> ~/.tmux.conf

echo "set -g status-right '#{battery_status_bg} Batt: #{battery_icon} #{battery_percentage} #{battery_remain} | %a %h-%d %H:%M '" >> ~/.tmux.conf

echo "# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)" >> ~/.tmux.conf
echo "run '~/.tmux/plugins/tpm/tpm'" >> ~/.tmux.conf

## Install requirements for tmux battery plugin
sudo apt install -y acpi

## Press `Ctrl+B I` (uppercase I) to download plugins

## Reload tmux settings
tmux source ~/.tmux.conf


# Install micro
echo 'Install micro`
curl https://getmic.ro | bash
sudo mv micro /usr/bin


# Install W3M
echo 'Install W3M`
sudo apt install -y w3m w3m-img


# WiFi management
# Required for nmtui
sudo apt install -y network-manager


# Mouse support
sudo apt install -y gpm


# Boot from console by default
# sudo cp -n /etc/default/grub /etc/default/grub.orig
# sudo mv /etc/default/grub.orig /etc/default/grub && sudo update-grub
# TODO: https://askubuntu.com/questions/859630/how-to-start-ubuntu-in-console-mode


# Syncthing
# Install from graphical interface once


# Brightness control
sudo apt install brightnessctl




# Aliases
echo "alias lll='ls -lisah'" >> ~/.bashrc
echo "alias m='micro'" >> ~/.bashrc
echo "alias bright1='sudo brightnessctl -c backlight set +10%" >> ~/.bashrc
echo "alias bright0='sudo brightnessctl -c backlight set -10%" >> ~/.bashrc
echo "alias kbd1='sudo brightnessctl -d tpacpi::kbd_backlight set 1" >> ~/.bashrc
echo "alias kbd0='sudo brightnessctl -d tpacpi::kbd_backlight set 0" >> ~/.bashrc


```
