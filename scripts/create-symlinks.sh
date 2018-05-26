ln -vs `pwd`/.aliases ~
ln -vs `pwd`/.functions ~
ln -vs `pwd`/.gitconfig ~
curl https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore > ~/.gitignore
echo "\n# other\nnode_modules/" >> ~/.gitignore
ln -vs `pwd`/.hyper.js ~
ln -vs `pwd`/.tern-config ~
ln -vs `pwd`/.zshrc ~

ln -vs `pwd`/bin/sublw /usr/local/bin/sublw
ln -vs `pwd`/bin/codew /usr/local/bin/codew

mkdir -p ~/.vscode/extensions
ln -vs `pwd`/vscode-empty-theme ~/.vscode/extensions/empty-theme
