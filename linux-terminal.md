# Linux Terminal

This document outlines the configuration tweaks needed to go full-terminal on a work laptop/computer.

As a functional work station we need, at a minimum:

- ✅ Window toggle/switcher/splitter (`tmux`)
- ✅ Text Editor/IDE (`micro`)
  - 🟨 Move to neovim some day
- ✅ Web Browser (`w3m`)
- ✅ Syncthing
- ✅ System information
  - ✅ Battery level (`tmux plugin`)
  - ✅ Clock (`tmux`)
- ✅ WiFi management (`nmtui`)
- 🟨 Music player
- 🟨 Boot from console
- ✅ Aliases 
  - ✅ Load graphical interface (`startx`)
  - ✅ `lll`: `ls -lah`
  - ✅ `m`: Micro shortcut
- ✅ Mouse support (`gpm`)
  - 🟨 Compatibility with micro+w3m


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
  - 
- **Graphical interface**
  - Type command `startx`
  - `Ctrl+Alt+F1`-`F6`: switch between sessions
  - `Ctrl+Alt+F7`: switch to graphical session
- **WiFi**
  - Command `nmtui`
  

## Installation

1. Install OS with a graphical interface
2. Run these commands carefully one by one (it's not yet ready to simply run as-is)

```sh
cd ~

# Download this file for reference
curl https://raw.githubusercontent.com/luckyshot/snippets/main/linux-terminal.md >> ~/linux-terminal.md


# Aliases
echo "alias lll='ls -lisah'" >> ~/.bashrc
echo "alias m='micro'" >> ~/.bashrc


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


```
