#!/usr/bin/env zsh

# brew and casks
brew upgrade
brew cleanup -s

# npm and global packages
npm install -g npm@latest
npm update -g

# zplug plugins
zplug update
