## instalation 
# echo 'source ~/dotfiles/.bashrc' >>~/.bashrc

################ aliases
source ~/dotfiles/.bash_aliases

################ History
source ~/dotfiles/.bashrc_history

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
export PIP_DOWNLOAD_CACHE=~/.pip/cache
mkdir -p $PIP_DOWNLOAD_CACHE
