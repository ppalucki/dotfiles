#!/bin/bash
ln -sv ~/dotfiles/.vimrc ~/.vimrc
ln -sv ~/dotfiles/.screenrc ~/.screenrc
ln -sv ~/dotfiles/.vim ~/
ln -sv ~/dotfiles/.gitconfig ~/.gitconfig
ln -sv ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sv ~/dotfiles/.ackrc ~/.ackrc
ln -sv ~/dotfiles/.ctags ~/.ctags
ln -sv ~/dotfiles/.bash_aliases ~/.bash_aliases
ln -sv ~/dotfiles/.ideavimrc ~/.ideavimrc 
ln -sv ~/dotfiles/.gdb.py ~/.gdb.py
ln -sv ~/dotfiles/.gdbinit ~/.gdbinit
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall
echo done
