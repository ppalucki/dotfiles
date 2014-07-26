##############################
#### ALIASES core and other
##############################
# apt
alias aptinst='sudo apt-get -y install'
alias aptsearch='apt-cache search'

### aliasy pip & wheel
WHEELHOUSE='/home/ppalucki/workspace/egg/gm_wheelhouse/'
alias cdwheel='cd $WHEELHOUSE'
alias pipdown='pip install -d $WHEELHOUSE '
alias pipwheel='pip wheel -f $WHEELHOUSE -w $WHEELHOUSE '
alias pipinst='pip install --no-index --use-wheel -f $WHEELHOUSE '

### pgrep/pkill process managment
alias pgrepe='pgrep -lf'
alias pkille='pkill -ef'
alias pkille9='pkill -9 -ef'
alias svi='set -o vi'
# sudo reset lightdm
alias resldm='sudo restart lightdm'
### screen focus change w screen
alias f="screen -X focus"
# some more ls aliases
alias llh='ls -ahlF'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# ls i utilki 
#alias ll='ls -l'
#alias ls='ls --color=auto'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#############################################
### ALIASES cd
#############################################
alias cdgm="workon getmedia;title getmedia"
alias cdgm2="workon getmedia2;title getmedia"
alias cdexp="workon getmedia;cd ~/workspace/exp/getmedia;title exp;export PYTHONPATH=/home/ppalucki/workspace/exp"
alias cdvpn="workon getmedia;cd ~/workspace/vpn/getmedia;title vpn;export PYTHONPATH=/home/ppalucki/workspace/vpn"
alias cdmm="cd ~/workspace/muzomedia; title muzomedia"
alias cdgg='workon greengate;title greengate'
alias cdt='workon testy'
alias cdw='cd /home/ppalucki/workspace'
alias cdd="cd ~/downloads/"
alias cdg="export GOPATH=~/workspace/goprojects ; cd \$GOPATH/src ; export PATH=\$PATH:\$GOPATH/bin"
alias cdvim="cd ~/.vim/bundle"

##########################################
## vim and vi wersion python3 
##########################################
# zaintaslowany z src/vim
alias vi3='/usr/local/bin/vim'
alias vim3='/usr/local/bin/vim'


########################################
## gitk
########################################
alias gitka='gitk --all'
