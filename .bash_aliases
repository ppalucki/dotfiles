##############################
#### ALIASES core and other
##############################

if [[ $OSTYPE == 'linux-gnu' ]]; then
    alias ll='ls -al --color=auto'
elif [[ $OSTYPE == 'darwin13' ]]; then
    alias ll='ls -alG'
fi


### grep 
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

### vim
alias vi='vim'

#############################################
### ALIASES cd
#############################################
alias cdw='cd ~/work'
alias cdd='cd ~/Downloads'
alias cdvim='cd ~/.vim/bundle'


#############################################
### ubuntu apt-get
#############################################
alias aptinst='sudo apt-get install'
alias aptsearch='apt-cache search'

