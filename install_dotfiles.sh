#!/bin/sh

CURRENT_DIR=`pwd`
cd ~/.dotfiles
git submodule init # idempotent
git submodule update
cd $CURRENT_DIR
cat $HOME/.dotfiles/bashrc >> $HOME/.bashrc
cat $HOME/.dotfiles/bash_profile >> $HOME/.bash_profile
ln -s $HOME/.dotfiles/vim $HOME/.vim
ln -s $HOME/.dotfiles/vimrc $HOME/.vimrc
mkdir $HOME/bash_completion.d
ln -s $HOME/.dotfiles/git-flow-completion/git-flow-completion.bash $HOME/bash_completion.d/git-flow-completion.bash

ln -s $HOME/.dotfiles/gitignore $HOME/.gitignore
ln -s $HOME/.dotfiles/gitconfig $HOME/.gitconfig

# Setup a global .gitignore
git config --global core.excludesfile '~/.gitignore'

