# Dotfiles

This repo contains dotfiles, and uses dotbot to provision new machines. To use it, run:

```
git clone https://github.com/gdiggs/dotfiles.git && \
dotfiles/install
```

If running on Ubuntu, you'll need to `apt install git vim` before running the script. You'll also want to add the following to `~/.bashrc`:

```
if [ -f ~/.bash_profile ]; then
  . ~/.bash_profile
fi
```

## Local Files

Git, Bash, and SSH in this repo all support local files for machine-specific configuration. To use them, add a file of the type with the corresponding path:

- Git: `~/.gitconfig.local`
- Bash: `~/.bash_profile.local`
- SSH: `~/.ssh/config.local`

All of these files are already gitignored.
