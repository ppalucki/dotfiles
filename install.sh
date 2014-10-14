#!/bin/bash
ln -sv `pwd`/.vimrc ~/.vimrc
ln -sv `pwd`/.screenrc ~/.screenrc
ln -sv `pwd`/.vim ~/.vim
ln -sv `pwd`/.gitconfig ~/.gitconfig
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo done
