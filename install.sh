#!/bin/bash
ln -sv ~/dotfiles/.vimrc ~/.vimrc
ln -sv ~/dotfiles/.screenrc ~/.screenrc
ln -sv ~/dotfiles/.vim ~/.vim
ln -sv ~/dotfiles/.gitconfig ~/.gitconfig
ln -sv ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sv ~/dotfiles/.ackrc ~/.ackrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo done
