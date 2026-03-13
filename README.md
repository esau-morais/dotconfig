# [dot] files

## Setup

```shell
git clone --bare git@github.com:USER/dotconfig.git $HOME/.dotfiles
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dot checkout
dot config --local status.showUntrackedFiles no
dot submodule update --init --recursive
```

Then run `install.sh` to install all dependencies.
