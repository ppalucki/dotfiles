## instalation 
# echo 'source ~/dotfiles/.bashrc' >>~/.bashrc

################ aliases
source ~/dotfiles/.bash_aliases

################ History
if [[ $OSTYPE == 'linux-gnu' ]]; then
    source ~/dotfiles/.bashrc_history
fi

###############################
#### PS1 (git - current branch) 
###############################
# (venv)blue(path)branch(red)$
### LINUX
if [[ $OSTYPE == 'linux-gnu' ]]; then
    source /etc/bash_completion.d/git-prompt
elif [[ $OSTYPE == 'darwin13' ]]; then
    source /usr/local/etc/bash_completion.d/git-prompt.sh
fi
export PS1='\[\033[01;34m\]\w\[\033[01;32m\]$(__git_ps1)\[\033[01;31m\]$\[\033[00m\] '

# shorten the path according to given depth
export PROMPT_DIRTRIM=3

###############################
### VIM: default editor
###############################
export EDITOR=vim
# export GIT_EDITOR= 
# vim for psql
export PSQL_EDITOR="vi -c 'setf sql'"

########################################
## UTILITY FUNCTIONS
########################################
function title {
    echo -ne "\033]0;"$*"\007"
}

######################################
# PIP Python
#####################################
# moved to ~/.pip/pip.conf
# export PIP_DOWNLOAD_CACHE=~/.pip/cache
# mkdir -p $PIP_DOWNLOAD_CACHE

#####################################
# VIM PAGER
#####################################
#
# installation:
# cd ~/bin
# git clone https://github.com/rkitover/vimpager
# ln -s ~/bin/vimpager/vimpager vimpager
# simple version
# export PAGER='vim -R -c "set ft=man nonu nolist" -'
# http://vim.wikia.com/wiki/VimTip167
export PAGER="/bin/sh -c \"unset PAGER;col -b -x | vim -R -c 'set ft=man nomod nolist' -c 'map q :q<cr>' -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
