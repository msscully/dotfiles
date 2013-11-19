#!/bin/sh

cat $HOME/.dotfiles/bashrc >> $HOME/.bashrc
cat $HOME/.dotfiles/bash_profile >> $HOME/.bash_profile
ln -s $HOME/.dotfiles/vim $HOME/.vim
ln -s $HOME/.dotfiles/vimrc $HOME/.vimrc
