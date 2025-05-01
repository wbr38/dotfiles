# Install

```sh
DOTFILES_REPO="${XDG_DATA_HOME:-$HOME/.local/share}/dotfiles/git"
$ git clone --bare https://git.extacy.cc/Extacy/dotfiles "$DOTFILES_REPO"
$ alias dotfiles="git --git-dir=$DOTFILES_REPO --work-tree=$HOME"
$ dotfiles checkout
```

## Windows
Set the environment variable
```
MPV_HOME=\\wsl.localhost\Ubuntu\home\wsl\.config\mpv
```