dotfiles
========
SETTING UP DEV ENVIRONMENT
88888   Test for git multiple accounts 8888888

* Homebrew
* Xcode
* Xcode Command Line tools

* Iterm
* Z-Shell

* Git
* Vundle

* Node
* NPM (automatically installed with Node)
* Grunt
* Coffeescript

CONFIGURING DOTFILES

* Create/clone dotfiles repo
* bash_profile - master configurations for system wide aliases, PATHs, and stuff
* GIT - Create gitconfig for only git stuff and point path to include .gitconfig.user (able to use gitconfig for different accounts)
* GIT - Create .gitconfig.user for specific account
* ZSH - setup zshrc
* VIM - setup vimrc
* Run bootstrap.sh script to create symlinks between actual dotfiles in root directory to dotfiles repo OR do it manually by running from CLI ln -s ~/dotfiles/vimrc .vimrc
* Run vim plugin install CLI vim +PluginInstall (https://github.com/gmarik/Vundle.vim)

