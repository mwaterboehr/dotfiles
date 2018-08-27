COMPUTER_NAME = "darkbook"

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "$COMPUTER_NAME"
sudo scutil --set HostName "$COMPUTER_NAME"
sudo scutil --set LocalHostName "$COMPUTER_NAME"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$COMPUTER_NAME"

###############################################################################
# Terminal                                                                    #
###############################################################################

# Set KeyRepeat to maximum
defaults write NSGlobalDomain KeyRepeat -int 0

# Enable tab-clicking
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

###############################################################################
# Dock                                                                        #
###############################################################################

# Enable autohide for the Dock
defaults write com.apple.dock autohide -bool

# Set up screensaver for top left corner
defaults write com.apple.dock wvous-br-corner -int 2
defaults write com.apple.dock wvous-br-modifier -int 0

# Wipe all persistent (default) app icons from the Dock
defaults write com.apple.dock persistent-apps -array

for app in "Dock"; do
	killall "${app}" &> /dev/null
done
echo "Done. Some of the changes may require a restart."
