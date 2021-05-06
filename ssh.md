# SSH

Everything related to configuring SSH goes here.


## Git and SSH keys

- `ls -al ~/.ssh`
- `ssh-keygen -t ed25519 -C "email@example.com"`
- `eval "$(ssh-agent -s)"`
- `nano ~/.ssh/config`

```
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```

- `ssh-add -K ~/.ssh/id_ed25519`
- `pbcopy < ~/.ssh/id_ed25519.pub`
- Paste the clipboard contents into Github or whatever
- Do a first connection `ssh -T git@github.com` and add the RSA host key
