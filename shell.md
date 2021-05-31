# Shell

```sh
nano ~/.bashrc

alias serveron="sudo service apache2 restart;sudo service mysql start"
alias ll="ls -la"
alias _u="sudo apt update;sudo apt upgrade"
```

`sudo nano /etc/apache2/sites-enabled/000-default.conf`



## Git and SSH keys

- `ls -al ~/.ssh`
- `ssh-keygen -t ed25519 -C "email@example.com"`
- `eval "$(ssh-agent -s)"`
- `nano ~/.ssh/config`

```sh
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```

- `ssh-add -K ~/.ssh/id_ed25519`
- `pbcopy < ~/.ssh/id_ed25519.pub`
- Paste the clipboard contents into Github (https://github.com/settings/keys) or whatever
- Do a first connection `ssh -T git@github.com` and add the RSA host key

If you are getting a `Permission denied (publickey). fatal: Could not read from remote repository. Please make sure you have the correct access rights and the repository exists.` error or similar, usually after a reboot, try running `ssh-add -K ~/.ssh/id_ed25519` again.
