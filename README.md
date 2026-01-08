# My dotfiles

## Installation

Install prerequisites first

```sh
suto apt install stow nvim zsh
```

Use `stow` to install required packages

For example

```sh
git clone git@github.com:npca/dotfiles
cd dotfiles

stow -t ~ nvim zsh tmux
```
