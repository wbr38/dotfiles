# Windows

## Install
- [ ] Create a bootable USB using the media creation tool
- [ ] Install without internet so a local account is created, not a Microsoft one

## Drivers
Do this last as Windows will auto install drivers after connected to internet.
- [ ] Chipset
- [ ] GPU Drivers
- [ ] BIOS
- [ ] LAN
- [ ] Audio

## Software
- [ ] Firefox
  - [ ] Log in to Firefox account, sync
  - [ ] Hide bookmarks in toolbar
  - [ ] Shown extensions: Bitwarden, uBlock, DarkReader
  - [ ] Home: [./img/firefox_home.png](./img/firefox_home.png)
  - [ ] Make imagus activate right click (instantly)
- [ ] Chrome
- [ ] Everything
  - [ ]  Ignore *.lnk files `Tools | Options | Indexes -> Exclude`
- [ ] AutoHotkey
  - [ ] Make a startup app for Rebinds.ahk (lnk)
- [ ] 7-Zip
- [ ] WinsCP
- [ ] Discord
  - [ ] Vencord
  - Windows Settings
    - [ ] Disable exit to tray
  - Notifications
    - [ ] Disable desktop notifications
    - [ ] Disable taskbar flashing
    - [ ] Mute message sound
- [ ] Spotify
- [ ] Steam
- [ ] Nextcloud
	- [ ] Ignored folders: venv, node_modules, .git
- [ ] Notepad++
- [ ] VSCode
  - [ ] Sync with GitHub account
- [ ] Visual Studio
- [ ] Windows Terminal
  - [ ] Install from [~/.config/windows_terminal.json](~/.config/windows_terminal.json)
- [ ] Vim
- [ ] Git
```sh
git config --global core.autocrlf true
git config --global core.symlinks true
```
- [ ] Python (not from Windows store)
  - [ ] Install poetry
    - [ ] `poetry config virtualenvs.in-project true`
- [ ] NodeJS
  - [ ] Run `npm config set script-shell "C:\\Program Files\\Git\\bin\\bash.exe"` (run scripts using git bash)
- [ ] yt-dlp
- [ ] wget (from eternallybored.org)
- [ ] ffmpeg
- [ ] mpv
  - [ ] Install: Install: Move to programfiles then run installer/mpv-install.bat as Administrator
  - [ ] Set env variable: `MPV_HOME=\\wsl.localhost\Ubuntu\home\wsl\.config\mpv`
- [ ] Paint.net
- [ ] rufus
- [ ] LosslessCut
- [ ] VMWare Workstation Pro
- [ ] IDA Pro 9
  - [ ] Install like normal
  - [ ] Place patch.py in install dir. Run in elevated Powershell window
  - [ ] Change IDA to dark theme. Copy everything from `themes/dark` directory into `themes/default`.
- [ ] Transmission
- [ ] Insomnia REST Client or Bruno
- [ ] Cheat Engine
- [ ] Xenos
- [ ] ShareX
- [ ] SumatraPDF
  ```ini
  Theme = Darker
  ZoomLevels = 8.33 12.5 18 25 33.33 50 66.67 75 100 125 150 200 300 400 600 800 1000 1200 1600 2000 2400 3200 4800 6400
  ZoomIncrement = 3
  ```
- [ ] Office 365
  - "ProPlus2024Retail" from https://gravesoft.dev/office_c2r_links#english-en-us
  - HWID activation from https://massgrave.dev/#method_1_-_powershell
- [ ] Local Send
- [ ] Telerik Fiddler Classic
- [ ] Logitech G Hub
  

## Configuration
- [ ] Change refresh rate to 144hz
- [ ] Disable mouse Acceleration
- [ ] Disable Sticky Keys
- [ ] Disable desktop notifications
- [ ] High performance power plan + Disable wake timers
  - [ ] Disable Fast startup (hibernation)
- [ ] Uninstall everything in start menu
- [ ] Disable all windows sounds
- [ ] "Adjust the appearance and performance of windows" - [./img/performance_options.png](./img/performance_options.png)
- [ ] Disable `Accessibility > Visual effects > Animation Effects`
- [ ] Enable dark mode
- [ ] Taskbar Settings
  - [ ] Order: [./img/taskbar.png](./img/taskbar.png)
  - [ ] Automatically hide
  - [ ] Long search bar "Search icon and label"
  - [ ] Disable flashing
  - [ ] Regedit hide: https://superuser.com/a/1216804
- [ ] Disable Activity History
- [ ] Stop folders from being shown in QuickAccess (File explorer): Three dots, options, untick all boxes in Privacy
- [ ] Disable search web results
- [ ] Disable "Change brightness based on content"
- [ ] Use legacy explorer context menu (right click menu)
  `reg add "HKEY_CURRENT_USER\SOFTWARE\CLASSES\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /ve /f`
- [ ] Change keyboard repeat delay and rate
  ```ini
  [Computer\HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response]
  AutoRepeatDelay=130
  AutoRepeatRate=24
  Flags=27
  ```
  Restart PC before this so changes to Sticky keys etc are applied.
  If any accessibility settings are modified after changing these registry values then the rate and delay will be set to 0
  Log in and out to apply changes
- [ ] Disable taskbar flashing
  ```ini
  [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
  "TaskbarFlashing"=dword:00000000
  ```
- [ ] Disable bing windows search
  - Goto `HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search`
  - Make a new DWORD (32-bit) called: BingSearchEnabled Set the value = 0


## WSL
- [ ] Change theme to Campbell
- [ ] Change cursor shape to empty box
- [ ] Change default profile to Ubuntu
- [ ] Change sudoedit to vim: `sudo update-alternatives --config editor`
- [ ] Change $HOME
  - [ ] Edit /etc/passwd to /mnt/c/Users/William
  - [ ] `cp /home/wsl/.* .`
- [ ] `/etc/wsl.conf` (https://superuser.com/a/1663931/1796967)
- [ ] `mklink "C:\Users\William\.vimrc" "\\wsl.localhost\Ubuntu\home\wsl\.vimrc"` (just for vscode vimrc)
- [ ] File metadata / system permissions
  ```
  [automount]
  options = "metadata,umask=22,fmask=11"
  ```
- [ ]  Then `wsl --shutdown` from Powershell