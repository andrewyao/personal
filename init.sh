#!/bin/sh

# remove original files
rm -rf ~/.bashrc
rm -rf ~/.vimrc
rm -rf ~/.vim
# create symbolic links
ln -s $HOME/github/andrewyao/personal/.bashrc ~/.bashrc
ln -s $HOME/github/andrewyao/personal/vim ~/.vim
ln -s $HOME/.vim/.vimrc ~/.vimrc

