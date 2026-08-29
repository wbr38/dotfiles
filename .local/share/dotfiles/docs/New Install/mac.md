# MacOS

## Config
```sh
# Increase keyboard rate
defaults write -globalDomain ApplePressAndHoldEnabled -bool false   # Disable press and hold for special characters
defaults write -globalDomain InitialKeyRepeat -int 9                # Delay before repeat key
defaults write -globalDomain KeyRepeat -int 2                       # Repeat rate

# Desktop: Minimise windows into application icon
defaults write com.apple.dock minimize-to-application -bool true

# Desktop: Minimise windows using scale effect
defaults write com.apple.dock mineffect -string "scale"

# Dock: Hide suggested and recent apps
defaults write com.apple.dock show-recents -bool false

# Finder: Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: Show path (Toolbar -> View)
defaults write com.apple.finder ShowPathbar -bool true

# Function Keys: Use as standard keys
defaults write -globalDomain com.apple.keyboard.fnState -bool true

# Show battery percentage
defaults -currentHost write com.apple.controlcenter.plist BatteryShowPercentage -bool true

# Tick Mission Control: Group windows by application
defaults write com.apple.dock expose-group-apps -bool true

# Trackpad: app expose 4 finger down
defaults write com.apple.dock showAppExposeGestureEnabled -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2

# Trackpad: enable dragging 3 finger style
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

# Trackpad: tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Untick Mission Control: Automatically rearrange spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Untick Mission Control: Displays have separate spaces
defaults write com.apple.spaces spans-displays -bool true

# Untick Mission Control: When switching to an application, switch to a Space with open windows for the applicaiton
defaults write -globalDomain AppleSpacesSwitchOnActivate -bool false

# Untick Mouse > Advanced > Pointer acceleration
defaults write -globalDomain com.apple.mouse.linear -bool true

# Ensure ticked Trackpad > Scroll & Zoom > Natural scrolling
defaults write -globalDomain com.apple.swipescrolldirection -bool true

# Untick Airdrop & Continuity > Allow Handoff between this mac and your iCloud devices
defaults write ~/Library/Preferences/ByHost/com.apple.coreservices.useractivityd.plist ActivityAdvertisingAllowed -bool false
defaults write ~/Library/Preferences/ByHost/com.apple.coreservices.useractivityd.plist ActivityReceivingAllowed -bool false
```

To manually configure:
- [ ] Desktop: Snap to grid (right click, Sort by snap to grid)
- [ ] Displays: Show all resolutions and click `1800x1125`
- [ ] Finder: Custom toolbar (add delete and airdrop)
- [ ] Untick Displays: Automatically adjust brightness
- [ ] Untick Keyboard: Adjust keyboard brightness in low light

## Applications
Application specific manual configurations

- VSCode
  - [ ] Add Open in VSCode right click https://stackoverflow.com/questions/64040393/open-a-folder-in-vscode-through-finder-in-macos
- mpv
  - [ ] Brew doesn't have a cask for mpv, so to add to Applications: https://github.com/9beach/mpv-app-bundle
  - [ ] https://github.com/mpv-player/mpv/wiki/FAQ#how-can-i-make-mpv-the-default-application-for-opening-movie-files-on-macos-osx
- [ ] neovim
  ```sh
  brew install bob
  bob use nightly
  ```