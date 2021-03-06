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

    if [[ -f /etc/bash_completion.d/git-prompt ]]; then
        # ubuntu
        source /etc/bash_completion.d/git-prompt
    else
        # fedora
        source /usr/share/git-core/contrib/completion/git-prompt.sh
    fi

elif [[ $OSTYPE == 'darwin13' ]]; then
    source /usr/local/etc/bash_completion.d/git-prompt.sh
fi
export PS1='\[\033[01;34m\]\w\[\033[01;32m\]$(__git_ps1)\[\033[01;31m\]$\[\033[00m\] '

# shorten the path according to given depth
export PROMPT_DIRTRIM=3

# go get github.com/sivel/powerline-shell-go
# fonts: https://github.com/powerline/fonts
# condtional install powerline-shell-go if installed
if hash powerline-shell-go 2>/dev/null ; then 
    function _update_ps1() {
       export PS1="$(powerline-shell-go $? 2> /dev/null)"
    }
    export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

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
# doesn't work with git lg

# doesn't work with fedorea :(
# export VIM_PAGER="/bin/sh -c \"unset PAGER;col -b -x -p | vim -R -c 'set ft=man nomod nolist' -c 'map q :q<cr>' -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
# alias man='PAGER=$VIM_PAGER man'


#####################################
# disable Ctrl-s freeze
#####################################
stty -ixon
