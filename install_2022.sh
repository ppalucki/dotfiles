#!/bin/bash
ln -sv $PWD/vimrc_2022 ~/.vimrc
ln -sv $PWD/tmux.conf_2022 ~/.tmux.conf
ln -sv $PWD/gitconfig_2022 ~/.gitconfig
ln -sv $PWD/zshrc_2022 ~/.zshrc
mkdir -p ~/.config/
ln -sv $PWD/k9s ~/.config/
#ln -sv $PWD/.ctags ~/.ctags
mkdir -p ~/.ctags.d/
ln -sv $PWD/.ctags ~/.ctags.d/yaml.ctags

echo "Please also execute: ./install-oh-my-zsh.sh"
