# dotfiles

My personal dotfiles for Windows (WSL), MacOS, and Linux.

## Install
```sh
DOTFILES_REPO="$HOME/.local/share/dotfiles/git"
$ git clone --bare https://github.com/wbr38/dotfiles "$DOTFILES_REPO"
$ alias dotfiles="git --git-dir=$DOTFILES_REPO --work-tree=$HOME"
$ dotfiles config --local status.showUntrackedFiles no
$ dotfiles checkout
```
