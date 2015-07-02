##############################
#### ALIASES core and other
##############################

if [[ $OSTYPE == 'linux-gnu' ]]
then
    alias ll='ls -al --color=auto'
elif [[ $OSTYPE == 'darwin13.4.0' ]]
then
    alias ll='ls -alG'
fi


### grep 
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

### vim
# alias vi='vim' # wrong habbit

### tmux 256 colors
alias tmux='tmux -2'
# most useful alias on earth
alias ta='tmux a'

#############################################
### ALIASES cd
#############################################
alias cdw='cd ~/work'
alias cdgo='export GOPATH=~/work/go/;cd $GOPATH'
alias cdd='cd ~/Downloads'
alias cdvim='cd ~/.vim/plugged'


#############################################
### ubuntu apt-get
#############################################
alias aptinst='sudo apt-get install'
alias aptsearch='apt-cache search'


#############################################
# devstack
alias cds='cd /opt/stack'
alias cdds='cd /opt/stack/devstack'
alias openrc='source /opt/stack/devstack/openrc admin'
alias gitgrepall='git rev-list --all | xargs git grep'


##############################################
## go debugger
function gogdb {
echo compile...
go build -gcflags "-N -l" $1
if [ $? == 0 ] ;then
    read -p "starting cgdb (press a key) ..."
    cgdb $2 
fi
}

# example 
function gotestgdb {
echo compile...
go test -c $1
if [ $? == 0 ] ;then
    export $(go test -work -c -gcflags "-N -l" $1 2>&1)
    read -p "starting cgdb (press a key) ..."
    cgdb $2 -- -d $WORK
fi
}

##############################################
#
# git (doing reviews)
#
##############################################
# find common ancestor and then do stat or dirf or lg
alias reviewstat="git d --stat \`git merge-base master HEAD\`"

alias reviewdiff="git d \`git merge-base master HEAD\` $@"

alias reviewlg="git lg \`git merge-base master HEAD\`..HEAD -- $@"

