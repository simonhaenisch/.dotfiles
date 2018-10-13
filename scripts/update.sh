#!/usr/bin/env zsh

# brew and casks
/usr/local/bin/brew upgrade
/usr/local/bin/brew cleanup -s

# npm and global packages
/usr/local/bin/npm install -g npm@latest
/usr/local/bin/npm update -g
