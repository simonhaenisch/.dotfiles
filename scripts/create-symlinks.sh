#!/usr/bin/env zsh

ln -vs `pwd`/.aliases ~
ln -vs `pwd`/.functions ~
ln -vs `pwd`/.gitconfig ~
curl https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore > ~/.gitignore
echo "\n# other\nnode_modules/" >> ~/.gitignore
ln -vs `pwd`/.nanorc ~
ln -vs `pwd`/.vimrc ~
ln -vs `pwd`/.zshrc ~

sudo ln -vs `pwd`/bin/sublw /usr/local/bin/sublw
sudo ln -vs `pwd`/bin/codew /usr/local/bin/codew

mkdir -p ~/.vscode/extensions
ln -vs `pwd`/vscode-empty-theme ~/.vscode/extensions/empty-theme

mkdir -p ~/.ssh
ln -vs /Users/$USER/Documents/ssh-config ~/.ssh/config
