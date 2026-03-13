# [dot] files

## Setup

```shell
git clone --bare git@github.com:USER/dotconfig.git $HOME/.dotconfig
alias dot='git --git-dir=$HOME/.dotconfig --work-tree=$HOME'
dot checkout
dot config --local status.showUntrackedFiles no
```
