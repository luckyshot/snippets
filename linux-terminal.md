# Linux Terminal

This document outlines the configuration tweaks needed to go full-terminal on a work laptop/computer. The motivation for this is to increase productivity and creativity by removing distractions and having a clean, simple and minimal workspace that also saves tons of battery life whenever you're out and about.

## Checklist

As a functional work station we need, at a minimum:

_(✅: Scripted; 🟨: Pending; 🤚 Manually done following some steps)_

- ✅ Window toggle/switcher/splitter (`tmux`)
- ✅ Terminal helpers/autocomplete/etc (`Oh My Zsh`)
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
  - Alias `m`: Micro shortcut
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
  - Alias `b1`: Increase screen brightness by 10%
  - Alias `b0`: Decrease screen brightness by 10%
  - Alias `k1`: Turn keyboard light on
  - Alias `k0`: Turn keyboard light off
- **Graphical interface**
  - Command `sudo startx`: Load graphical interface


## Installation

1. Install OS with a graphical interface
2. Run these commands carefully one by one (it's not yet ready to simply run as-is)

```sh
cd ~

# Download this file for reference
curl https://raw.githubusercontent.com/luckyshot/snippets/main/linux-terminal.md >> ~/linux-terminal.md

# Zsh
## Install Zsh
sudo apt install zsh
## Make it default
chsh -s $(which zsh)

## You should now logout and log back in

## Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Install Zsh plugins
### Zsh Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

## Activate Zsh plugins
sed -i 's/plugins=(git)/plugins=(zsh-autosuggestions git)/g' .zshrc


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
echo "alias lll='ls -lisah'" >> ~/.zshrc
echo "alias m='micro'" >> ~/.zshrc
echo "alias b1='sudo brightnessctl -c backlight set +25'" >> ~/.zshrc
echo "alias b0='sudo brightnessctl -c backlight set 25-'" >> ~/.zshrc
echo "alias k1='sudo brightnessctl -d tpacpi::kbd_backlight set 1'" >> ~/.zshrc
echo "alias k0='sudo brightnessctl -d tpacpi::kbd_backlight set 0'" >> ~/.zshrc


```
