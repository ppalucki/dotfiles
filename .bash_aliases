##############################
#### ALIASES core and other
##############################

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
### screen focus change w screen
alias f="screen -X focus"

### grep 
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

### fix ack-grep dla vim i dla mnie
alias ack-grep='ack'

### ll
alias ll='ls -alFG'
alias ls='ls -FG'

### vim
alias vi='vim'

#############################################
### ALIASES cd
#############################################
alias cdgm="workon getmedia;title getmedia"
alias cdw='cd ~/workspace'
alias cdd='cd ~/Downloads'
alias cdvim='cd ~/.vim/bundle'

