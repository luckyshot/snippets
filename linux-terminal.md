# Linux Terminal

Console-only setup for a work laptop. You must be comfortable with basic terminal commands. Plugins and customizations are kept to a minimum.

**OS: Debian (Trixie), console-only install. No X11 or Wayland.**

## 🟩 Advantages

- 💪 **Productivity**: Removes distractions. Clean, minimal workspace.
- 🔋 **Battery**: Significant savings vs a full desktop. On a ThinkPad P14s: Ubuntu+KDE consumed 8-12W; full console mode drops to 4-7W.

## 🟥 Drawbacks

- Current browser (`w3m`) doesn't load JavaScript websites, so no web clients for Slack/Jira/Reddit/etc
  - Check out [Carbonyl](https://github.com/fathyb/carbonyl) for Chromium inside the terminal (heavier, but runs JS)

## 🏁 Checklist

_✅: Done; 🫳 Manual process; 🔲: Pending_

### Device management

- ✅ Boot from console (Debian console-only install)
- ✅ Auto-login on boot (kmscon systemd override)
- ✅ tmux auto-launch on login
- ✅ Window toggle/switcher/splitter (`tmux`)
- ✅ Terminal improvements (`Oh My Zsh`)
  - ✅ Zsh
  - ✅ zsh-autosuggestions
  - ✅ dirhistory
  - ✅ zsh-syntax-highlighting
  - ✅ Powerlevel10k
- ✅ System information
  - ✅ Battery level (`acpi` in tmux status bar)
  - ✅ Clock (`tmux`)
- ✅ WiFi management (`nmtui`)
- ✅ Mouse support (`gpm`)
  - 🔲 Compatibility with micro+w3m
- ✅ Controls
  - ✅ Volume (`amixer`)
  - ✅ Screen brightness (`light`)
  - ✅ Keyboard brightness (`light`)
- ✅ Colors/fonts (`kmscon`: 256 colors, scalable fonts)

### The Basics

- ✅ Text Editor/IDE (`micro` + `nano`)
- ✅ Web Browser (`w3m`)

### The Extras

- ✅ Syncthing
- ✅ Music & Video player (`mpv` via ALSA)
- ✅ Calculator (`python3`)
- 🔲 Emails
- 🔲 Jira
- 🔲 Slack
- 🔲 YouTube (browse and watch)

## ⌨ Shortcuts

### tmux

Pane splitting:
- `Ctrl+B %`: Split horizontally
- `Ctrl+B "`: Split vertically
- `Ctrl+B Arrow`: Focus another pane
- `Ctrl+D`: Close focused pane

Windows:
- `Ctrl+B c`: New window
- `Ctrl+B p`: Previous window
- `Ctrl+B 0-9`: Go to window N

### Zsh

- `Alt+Left`: Previous directory
- `Alt+Right`: Next directory
- `Alt+Up`: Parent directory
- `Alt+Down`: First child directory (alphabetical)

### w3m

- `Shift+Q`: Quit
- `Shift+B`: Go back
- `Shift+T`: New tab
- `Shift+U`: New URL

### micro

- Alias `m`: Launch micro

### mpv

- Command: `mpv {filename}`
- `9` / `0`: Volume down/up

### WiFi

- Command: `nmtui`

### Brightness

- Alias `b1`: Increase screen brightness by 25%
- Alias `b0`: Decrease screen brightness by 25%
- Alias `k1`: Turn keyboard backlight on
- Alias `k0`: Turn keyboard backlight off

### Volume

- Alias `v1`: Increase volume by 5%
- Alias `v0`: Decrease volume by 5%
- Alias `vm`: Toggle mute
- Interactive: `alsamixer`

### Graphical interface (emergency fallback)

- Command `sudo startx`: Start graphical interface
- Command `sudo init 3`: End graphical interface
- `Ctrl+Alt+F1`-`F6`: Switch between sessions
- `Ctrl+Alt+F7`: Switch to graphical session

## 🚧 Installation

### Before running the script

One manual step that can't be scripted:

**Install Debian (console-only)**
Use the text-based installer. On the "Software selection" screen, deselect "Debian desktop environment" and "GNOME". You will boot straight into a tty.
Leave the root password blank during install — this disables root and sets your user up with sudo instead.

**Accessing Syncthing web UI from another machine**
The script binds Syncthing to localhost only. To reach it from another machine, SSH port-forward:
```sh
ssh -nNT YOUR_HOSTNAME -L 8484:localhost:8384
# then visit http://localhost:8484 on your other machine
```

### Script

```sh
#!/bin/bash
set -e

# ─────────────────────────────────────────────
# DEBIAN TERMINAL SETUP
# Run after a fresh console-only Debian install
# ─────────────────────────────────────────────


# ── System update ────────────────────────────

sudo apt update && sudo apt upgrade -y


# ── kmscon (256 colors + scalable fonts) ─────
# Replaces the default tty. Supports 256 colors and Ctrl+/- zoom.
# Needed for auto-login setup below.

echo "deb http://deb.debian.org/debian/ trixie-backports main contrib non-free non-free-firmware" \
  | sudo tee /etc/apt/sources.list.d/trixie-backports.list
sudo apt update
sudo apt install -t trixie-backports -y kmscon


# ── Auto-login via kmscon ─────────────────────
# Creates a systemd drop-in that logs in the current user automatically on tty1.

sudo mkdir -p /etc/systemd/system/kmsconvt@tty1.service.d/
sudo tee /etc/systemd/system/kmsconvt@tty1.service.d/autologin.conf > /dev/null << EOF
[Service]
ExecStart=
ExecStart=/usr/bin/kmscon --login -- /bin/login -f $USER
EOF
sudo systemctl daemon-reload


# ── Core packages ─────────────────────────────

sudo apt install -y \
  zsh \
  tmux \
  acpi \
  w3m w3m-img \
  network-manager \
  gpm \
  light \
  alsa-utils \
  curl \
  git


# ── Group memberships ─────────────────────────
# 'video' allows light to control brightness without sudo
# 'audio' allows amixer to control volume without sudo

sudo usermod -aG video,audio $USER


# ── Zsh as default shell ──────────────────────
# NOTE: log out and back in after this for the change to take effect

chsh -s $(which zsh)


# ── Oh My Zsh ─────────────────────────────────
# RUNZSH=no and CHSH=no prevent it from restarting the shell mid-script

RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# ── Zsh plugins ───────────────────────────────

git clone https://github.com/zsh-users/zsh-autosuggestions \
  ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Activate plugins and Powerlevel10k theme in .zshrc
sed -i 's/plugins=(git)/plugins=(zsh-autosuggestions dirhistory zsh-syntax-highlighting git)/' ~/.zshrc
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc


# ── micro editor ─────────────────────────────

curl https://getmic.ro | bash
sudo mv micro /usr/bin


# ── tmux config ───────────────────────────────
# Battery % and clock in the status bar, no plugin manager needed

cat >> ~/.tmux.conf << 'EOF'
set-window-option -g status-right "#(acpi -b | grep -m1 -o -P '.{0,2}%') | %a %h-%d %H:%M "
EOF


# ── Syncthing ────────────────────────────────
# Installs from the official apt repo to get the latest v2.x release.
# Binds the web UI to localhost only — use SSH port-forwarding to access it remotely.

sudo mkdir -p /etc/apt/keyrings
sudo curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable-v2" \
  | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt update
sudo apt install -y syncthing apt-transport-https

# Enable and start as a user service (runs under your account, not root)
systemctl --user enable syncthing.service
systemctl --user start syncthing.service


# ── Aliases and tmux auto-launch ─────────────
# tmux starts automatically on login, but only on tty1 and not inside an existing session

cat >> ~/.zshrc << 'EOF'

# ── Aliases ───────────────────────────────────

alias lll='ls -lisah'
alias m='micro'

# Brightness (light — no sudo needed if in video group)
alias b1='light -A 25'
alias b0='light -U 25'
alias k1='light -s sysfs/leds/tpacpi::kbd_backlight -S 1'
alias k0='light -s sysfs/leds/tpacpi::kbd_backlight -S 0'

# Volume (amixer — no sudo needed if in audio group)
alias v1='amixer -q sset Master 5%+'
alias v0='amixer -q sset Master 5%-'
alias vm='amixer -q sset Master toggle'

# ── tmux auto-launch on tty1 ──────────────────

if [ -z "${TMUX}" ] && [ "$(tty)" = "/dev/pts/0" ]; then
    exec tmux
fi
EOF


# ─────────────────────────────────────────────
# DONE
# Next steps:
#   1. Log out and back in (applies: zsh as default shell, group memberships)
#   2. Run the Powerlevel10k wizard: p10k configure
#   3. Test audio: speaker-test -t wav -c 2
#   4. Pair Syncthing devices via web UI: ssh -nNT THIS_HOST -L 8484:localhost:8384
# ─────────────────────────────────────────────
```
