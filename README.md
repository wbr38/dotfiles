# dotfiles

My personal dotfiles for Windows (WSL), MacOS, and Linux.

## Install
```sh
DOTFILES_REPO="${XDG_DATA_HOME:-$HOME/.local/share}/dotfiles/git"
git clone --bare https://github.com/wbr38/dotfiles "$DOTFILES_REPO"
alias dotfiles="git --git-dir=$DOTFILES_REPO --work-tree=$HOME"
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
```

### Windows
```batch
del .config\vscode\settings.json
mklink /H .config\vscode\settings.json AppData\Roaming\Code\User\settings.json

del .config\vscode\keybindings.json
mklink /H .config\vscode\keybindings.json AppData\Roaming\Code\User\keybindings.json

del .config\windows_terminal.json
mklink /H .config\windows_terminal.json AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
```

### Mac
```sh
ln -f ~/.config/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -f ~/.config/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
```
