# dotfiles

> Backing up my dotfiles for others to poke through

## GNU Stow

This repository uses [GNU stow](https://www.gnu.org/software/stow/) to manage the config files to create symlinks to the system.

Run `stow <config file dir>` to create symlinks to the content of that config files directory.

For instance, to create symlinks to the Neovim configuration files, run:

```
$ stow nvim
```

## Settings for:

- Neovim >= v0.12 config files
- Tmux config file
- Git config files
- ZSH config file
