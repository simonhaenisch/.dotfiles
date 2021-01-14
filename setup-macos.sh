#!/usr/bin/env zsh

# inspired by https://mths.be/macos and others

# we need full disk access, otherwise `~` won't work
read "full_disk_access?Does this terminal have full disk access? (y/n): "
if [[ ! "$full_disk_access" =~ ^[Yy]$ ]]
then
	exit
fi

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

# install homebrew (http://brew.sh)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install brew formulae
for formula in antibody cloudflare/cloudflare/cloudflared cocoapods ffmpeg gh git gradle grc hub mas nano nmap node openssl python vim wallpaper youtube-dl zsh
do
	brew install "$formula"
done

# install casks
brew tap homebrew/cask-versions
brew tap homebrew/cask-drivers
brew tap homebrew/cask-fonts
for cask in ableton-live-intro android-studio anybar appcleaner behringer-x32-edit bettertouchtool clavia-nord-sound-manager figma firefox-developer-edition flux font-inter font-source-code-pro google-chrome hyper imageoptim iterm2 jamulus kap macpass microsoft-teams mpv slack spotify sublime-text the-unarchiver thumbsup ubersicht visual-studio-code whatsapp
do
	brew install --cask "$cask"
done

# install casks that run an installer which requires password
for cask_with_installer in google-drive-file-stream zoom
do
	brew install --cask "$cask_with_installer"
done

# soundflower needs special permissions
brew install --cask soundflower

# cleanup cache for brew and cask downloads
brew cleanup -s

# install global npm packages
npm install -g serve vercel

# load config
source ~/.zshrc

# set desktop background to solid color
wallpaper set-solid-color "#1E1E1E"

# install MAS apps
read "signed_into_mas?Are you signed into the App Store so apps can be installed? (y/n): "
if [[ "$signed_into_mas" =~ ^[Yy]$ ]]
then
	app_ids=(
		497799835  # Xcode
		409203825  # Numbers
		409183694  # Keynote
		409201541  # Pages
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

# create projects folder and clone some repos (using hub)
read "clone_projects?Clone projects (make sure ssh public key is added to github)? (y/n): "
if [[ "$clone_projects" =~ ^[Yy]$ ]]
then
	mkdir ~/Projects

	for repo in cloudcannon-boilerplate koa-shopify-auth md-to-pdf prettier-plugin-organize-imports simonhaenisch.com uebersicht-widgets ionic-team/ionic-framework ionic-team/stencil ionic-team/stencil-site
	do
		hub clone $repo ~/Projects/$repo
	done
fi

# create work folder and clone some work repos (using hub)
read "clone_work_projects?Clone work projects (make sure ssh public key is added to github)? (y/n): "
if [[ "$clone_work_projects" =~ ^[Yy]$ ]]
then
	mkdir ~/Work

	for repo in equippers/equippers.de hoodify/hoodify jitbug/jitbug jitbug/jitbug-helpers jitbug/jitbug.co.nz kleinholz-hamburg.de super-cut
	do
		hub clone $repo ~/Work/$repo
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
