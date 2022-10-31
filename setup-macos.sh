#!/usr/bin/env zsh

# inspired by https://mths.be/macos and others

# we need full disk access, otherwise `~` won't work
read "full_disk_access?Does this terminal have full disk access? (y/n): "
if [[ ! "$full_disk_access" =~ ^[Yy]$ ]]
then
	exit
fi

# backup existing dotfiles
source "scripts/backup-existing-files.sh"

# create symlinks for dotfiles
source "scripts/create-symlinks.sh"

# create host–specific zshrc file
printf "alias update='`pwd`/scripts/update.sh'" >> ~/.host-specific-zshrc

# install command line developer tools
xcode-select --install
read "After xcode-select has finished installing, press ENTER to continue... "
sudo xcodebuild -license accept

# install homebrew (http://brew.sh)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

eval $(/opt/homebrew/bin/brew shellenv)

# install brew formulae
for formula in antibody cloudflare/cloudflare/cloudflared cocoapods deno ffmpeg gh git gradle grc hub mas nano nmap node openssl python vim wallpaper youtube-dl zsh
do
	brew install "$formula"
done

# install casks
brew tap homebrew/cask-versions
brew tap homebrew/cask-drivers
for cask in ableton-live-intro anybar appcleaner behringer-x32-edit bettertouchtool figma firefox-developer-edition flux google-chrome hyper imageoptim iterm2 kap macpass mpv slack spotify sublime-text the-unarchiver thumbsup ubersicht visual-studio-code whatsapp
do
	brew install --cask "$cask"
done

# install casks that run an installer which requires password
for cask_with_installer in google-drive
do
	brew install --cask "$cask_with_installer"
done

# cleanup cache for brew and cask downloads
brew cleanup -s

# install global npm packages
npm install -g serve vercel

# load config
source ~/.zshrc

# install zsh plugins
zplug install

# set desktop background to solid color
wallpaper set-solid-color "#1E1E1E"

# install MAS apps
read "signed_into_mas?Are you signed into the App Store so apps can be installed? (y/n): "
if [[ "$signed_into_mas" =~ ^[Yy]$ ]]
then
	app_ids=(
		634148309  # Logic Pro X
		1470584107 # Dato
		1294126402 # HEIC Converter
		1018390387 # Swift Note
		404705039  # Graphic
		407963104  # Pixelmator
		1176895641 # Spark
		472790630  # Bible Study
	)

	for app_id in $app_ids
	do
		mas install "$app_id"
	done
fi

# git config
read 'gituser?Git User Name: '
git config --global user.name "$gituser"
git config --global user.email "$gituser@users.noreply.github.com"

# generate ssh key for github
ssh-keygen -t ed25519 -C "$gituser@users.noreply.github.com"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

gh auth login

# create projects folder and clone some repos
read "clone_projects?Clone projects (make sure ssh public key is added to github)? (y/n): "
if [[ "$clone_projects" =~ ^[Yy]$ ]]
then
	# mkdir ~/Projects

	for repo in md-to-pdf prettier-plugin-organize-imports simonhaenisch.com uebersicht-widgets
	do
		gh repo clone $repo ~/Projects/$repo
	done
fi

# create work folder and clone some work repos
read "clone_work_projects?Clone work projects (make sure ssh public key is added to github)? (y/n): "
if [[ "$clone_work_projects" =~ ^[Yy]$ ]]
then
	# mkdir ~/Work

	for repo in equippers/equippers.de euphoria-group/hoodify euphoria-group/geizhalsify
	do
		gh repo clone $repo ~/Work/$repo
	done
fi

read "writeDefaults?Write defaults? (y/n): "
if [[ "$writeDefaults" =~ ^[Yy]$ ]]
then
	# save to disk (not iCloud) by default
	defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -int 0

	# save screenshots to downloads folder
	defaults write com.apple.screencapture location ~/Downloads

	# disable auto correct features
	defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -int 0
	defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -int 0
	defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -int 0
	defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -int 0
	defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -int 0

	# enable full keyboard access for all controls (e.g. tab through dialog options)
	defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

	# finder settings
	defaults write NSGlobalDomain AppleShowAllExtensions -int 1 # show all extensions
	defaults write com.apple.finder ShowStatusBar -int 1 # show status bar
	defaults write com.apple.finder ShowPathbar -int 1 # show path bar
	defaults write com.apple.finder _FXSortFoldersFirst -int 1 # list folders first
	defaults write com.apple.finder FXDefaultSearchScope -string "SCcf" # search current folder by default
	defaults write com.apple.finder FXEnableExtensionChangeWarning -int 0 # no warning for changing extension
	defaults write com.apple.finder WarnOnEmptyTrash -int 0 # no warning to empty trash

	# dock settings
	defaults write com.apple.dock autohide -int 1 # enable auto-hide
	defaults write com.apple.dock autohide-delay -float 0.2 # set dock delay to 200 ms
	defaults write com.apple.dock autohide-time-modifier -int 0 # disable dock show/hide animation
	defaults write com.apple.dock show-process-indicators -int 1 # show indicator for open apps
	defaults write com.apple.dock showhidden -int 1 # make icons of hidden apps translucent

	# kill effected apps
	killall Finder
	killall Dock
	killall SystemUIServer

	echo "Done. Some changes might need a reboot to take effect."
fi
