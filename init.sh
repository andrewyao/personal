#!/bin/sh

# remove original files
mkdir -p $HOME/tmp
cp -rf ~/.bashrc $HOME/tmp
cp -rf ~/.vimrc $HOME/tmp
cp -rf ~/.vim $HOME/tmp
cp -rf ~/.gitconfig $HOME/tmp

rm -rf ~/.bashrc
rm -rf ~/.vimrc
rm -rf ~/.vim
rm -rf ~/.gitconfig

# create symbolic links
ln -s $HOME/andrewyao/personal/.bashrc ~/.bashrc
ln -s $HOME/andrewyao/personal/.vimrc ~/.vimrc
ln -s $HOME/andrewyao/personal/vim ~/.vim
ln -s $HOME/andrewyao/personal/.gitconfig ~/.gitconfig
