#!/bin/sh

# create symbolic links
rm -rf ~/.bashrc
rm -rf ~/.vimrc
rm -rf ~/.vim
ln -s $HOME/github/andrewyao/personal/.bashrc ~/.bashrc
ln -s $HOME/github/andrewyao/personal/vim ~/.vim
ln -s $HOME/.vim/.vimrc ~/.vimrc

