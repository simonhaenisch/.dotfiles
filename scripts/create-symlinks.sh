ln -vs `pwd`/.aliases ~
ln -vs `pwd`/.gitconfig ~
curl https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore > ~/.gitignore
echo "\n# other\nnode_modules/" >> ~/.gitignore
ln -vs `pwd`/.hyper.js ~
ln -vs `pwd`/.tern-config ~
ln -vs `pwd`/.zshrc ~

ln -vs `pwd`/bin/sublw /usr/local/bin/sublw
