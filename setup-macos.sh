#!/usr/bin/env zsh

# inspired by https://mths.be/macos and others

# change shell
chsh -s /bin/zsh

# backup existing dotfiles
source "scripts/backup-existing-files.sh"

# create symlinks for dotfiles
source "scripts/create-symlinks.sh"

# create host–specific zshrc file
printf "alias update='`pwd`/scripts/update.sh'" >> ~/.host-specific-zshrc

# git config
read 'gituser?Git User Name: '
git config --global user.name "$gituser"
git config --global user.email "$gituser@users.noreply.github.com"

# install MAS apps
read "signed_into_mas?Are you signed into the App Store so apps can be installed? (y/n): "
if [[ "$signed_into_mas" =~ ^[Yy]$ ]]
then
	app_ids=(
		409203825  # Numbers
		497799835  # Xcode
		409183694  # Keynote
		409203825  # Numbers
		1470584107 # Dato
		404705039  # Graphic
		1294126402 # HEIC Converter
		1018390387 # Swift Note
		409201541  # Pages
		407963104  # Pixelmator
		1176895641 # Spark
		634148309  # Logic Pro X
		472790630  # Bible Study
		409183694  # Keynote
		409201541  # Pages
	)

	for app_id in $app_ids
	do
		mas install "$app_id"
	done
fi

# install homebrew (http://brew.sh)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install brew formulae
for formula in antibody cloudflared cocoapods ffmpeg gh git gradle grc hub mas nano nmap node openssl python vim wallpaper youtube-dl zsh
do
	brew install "$formula"
done

# install casks
for cask in ableton-live-intro android-studio anybar appcleaner behringer-x32-edit bettertouchtool clavia-nord-sound-manager figma firefox-developer-edition flux font-inter font-source-code-pro google-chrome google-drive-file-stream hyper imageoptim iterm2 jamulus kap macpass microsoft-teams mpv slack soundflower spotify sublime-text the-unarchiver thumbsup ubersicht visual-studio-code whatsapp zoomus
do
	brew cask install "$cask"
done

# cleanup cache for brew and cask downloads
brew cleanup -s

# install global npm packages
npm install -g serve vercel

# load config
source ~/.zshrc

# create projects folder and clone some repos (using hub)
read "clone_projects?Clone projects (make sure ssh public key is added to github)? (y/n): "
if [[ "$clone_projects" =~ ^[Yy]$ ]]
then
	mkdir ~/Projects

	for repo in cloudcannon-boilerplate koa-shopify-auth md-to-pdf prettier-plugin-organize-imports simonhaenisch.com uebersicht-widgets ionic-team/ionic-framework ionic-team/stencil ionic-team/stencil-site
	do
		git clone "$repo" "~/Projects/$repo"
	done
fi

# create work folder and clone some work repos (using hub)
read "clone_work_projects?Clone projects (make sure ssh public key is added to github)? (y/n): "
if [[ "$clone_work_projects" =~ ^[Yy]$ ]]
then
	mkdir ~/Work

	for repo in equippers/equippers.de hoodify/hoodify jitbug/jitbug jitbug/jitbug-helpers jitbug/jitbug.co.nz kleinholz-hamburg.de super-cut
	do
		git clone "$repo" "~/Work/$repo"
	done
fi

read "writeDefaults?Write defaults? (y/n): "
if [[ "$writeDefaults" =~ ^[Yy]$ ]]
then
	# save to disk (not iCloud) by default
	defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

	# save screenshots to downloads folder
	defaults write com.apple.screencapture location ~/Downloads

	# no ds_store on network or usb drives
	defaults write com.apple.desktopservices DSDontWriteNetworkStores true
	defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

	# don't open photos app when devices are plugged in
	defaults write com.apple.ImageCapture disableHotPlug -bool true

	# no auto open for mounted transmit 4 drives (https://panic.com/blog/15-secrets-of-transmit/)
	defaults write com.panic.transmit OpenMountedFinderWindow -bool NO
	defaults write com.panic.transmitmenu OpenMountedFinderWindow -bool NO

	# don't auto-rearrange spaces based on usage
	defaults write com.apple.dock mru-spaces -bool false

	# increase sound quality for bluetooth headphones/headsets
	defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

	# enable subpixel font rendering on non-Apple LCDs
	defaults write NSGlobalDomain AppleFontSmoothing -int 1

	# don't offer new disks for time machine backup
	defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

	# disable auto correct features
	defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
	defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
	defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
	defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
	defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

	# trackpad: enable tap to click for this user and for the login screen
	defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

	# disable natural scrolling
	defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

	# mute all system sounds, including volume change feedback
	defaults write NSGlobalDomain com.apple.sound.beep.feedback -int 0
	defaults write com.apple.systemsound com.apple.sound.beep.volume -float 0
	defaults write com.apple.systemsound com.apple.sound.uiaudio.enabled -int 0

	# enable full keyboard access for all controls (e.g. tab through dialog options)
	defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

	# use scroll gesture with the Ctrl (^) modifier key to zoom
	defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
	defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
	defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

	# finder settings
	defaults write NSGlobalDomain AppleShowAllExtensions -bool true # show all extensions
	defaults write com.apple.finder ShowStatusBar -bool true # show status bar
	defaults write com.apple.finder ShowPathbar -bool true # show path bar
	defaults write com.apple.finder _FXSortFoldersFirst -bool true # list folders first
	defaults write com.apple.finder FXDefaultSearchScope -string "SCcf" # search current folder by default
	defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false # no warning for changing extension
	defaults write com.apple.finder WarnOnEmptyTrash -bool false # no warning to empty trash

	# dock settings
	defaults write com.apple.dock autohide -bool true # enable auto-hide
	defaults write com.apple.dock autohide-delay -float 0.2 # set dock delay to 200 ms
	defaults write com.apple.dock autohide-time-modifier -float 0 # disable dock show/hide animation
	defaults write com.apple.dock show-process-indicators -bool true # show indicator for open apps
	defaults write com.apple.dock showhidden -bool true # make icons of hidden apps translucent

	# kill effected apps
	killall Finder
	killall Dock
	killall SystemUIServer

	echo "Done. Some changes might need a reboot to take effect."
fi
