# Linux Terminal

This document outlines the configuration tweaks needed to go full-terminal on a work laptop/computer.

As a functional work station we need, at a minimum:

- Window toggle/switcher/splitter (`tmux`)
- Text Editor/IDE (`micro`)
- Web Browser (`w3m`)
- System information
  - Battery level (`tmux plugin`)
  - Clock (`tmux`)

We will also need to do the following settings tweaks:

- Boot from console directly, with an easy alias/command to turn on graphical interface just in case we need to do a videocall, etc.

We will set up these aliases:

- `mc`: Micro shortcut
- `lll`: `ls -lah`
- ``:

And here's some good shortcuts:

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

## Script

```sh
cd ~

# Install tmux
echo 'Install tmux'
sudo apt install tmux

# Install micro
echo 'Install micro`
curl https://getmic.ro | bash
sudo mv micro /usr/bin

# Install W3M
echo 'Install W3M`
sudo apt install w3m w3m-img




```
