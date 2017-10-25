# ------------------
# great reference:
# https://github.com/herrbischoff/awesome-osx-command-line
# ------------------

COMPUTER_NAME := 'replibook'

# Allow apps downloaded from "Anywhere"
sudo spctl --master-disable
# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# See secrets.blacktree.com
chsh -s /bin/zsh $(USER)
sudo scutil --set ComputerName $(COMPUTER_NAME)
sudo scutil --set HostName $(COMPUTER_NAME)
sudo scutil --set LocalHostName $(COMPUTER_NAME)
sudo defaults write \
  /Library/Preferences/SystemConfiguration/com.apple.smb.server \
  NetBIOSName -string $(COMPUTER_NAME)

# Disabled shadow in screenshots
@defaults write com.apple.screencapture disable-shadow -bool true

# Enalble Ctrl+Alt+cmd+t for darkmode
@sudo defaults write /Library/Preferences/.GlobalPreferences.plist \
  _HIEnableThemeSwitchHotKey -bool true

# no .DS_Store on network
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Finder
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://$(HOME)/Downloads/"

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Trackpad: enable tap to click for this user and for the login screen (1 enabled, 0 disabled)
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 0
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 0
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 0
# PRE-SIERRA:
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable "Natural" scroll
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
# Enable move with 3 fingers
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# dock size & autohidden dock
defaults write com.apple.dock tilesize -int 128
defaults write com.apple.dock autohide -bool true

# 14 days on ical
defaults write com.apple.iCal n\ days\ of\ week 14

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool true
defaults write NSGlobalDomain KeyRepeat -int 0

# Disable auto-correction
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# scrollbars on always!
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# expand save/print dialogs by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# remove all default icons on the dock (for when first setting up)
defaults delete com.apple.dock persistent-apps
defaults delete com.apple.dock persistent-others
killall Dock

# unhide Library folder!
chflags nohidden ~/Library/
