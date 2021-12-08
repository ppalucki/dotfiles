# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(gitfast autojump command-not-found common-aliases docker tmux history wd systemd golang)
# plugins=(git gitfast common-aliases docker history wd systemd golang extract ssh-agent urltools vagrant tmux kubectl httpie python ansible)
plugins=(gitfast common-aliases docker history wd systemd golang extract ssh-agent urltools vagrant tmux httpie python cargo kubectl kubectx)


### VI-mode - readline doesn't work
#(vi-mode colemak) 

# User configuration
ZSH_TMUX_AUTOSTART=false

### gitfast
# GIT_PS1_DESCRIBE_STYLE=describe 

# export MANPATH="/usr/local/man:$MANPATH"
#
############################################
### PATH ~/bin
###########################################
#export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.krew/bin:${KREW_ROOT:-$HOME/.krew}/bin"
#export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.krew/bin:${KREW_ROOT:-$HOME/.krew}/bin"
export PATH=$PATH:/usr/local/go/bin

source $ZSH/oh-my-zsh.sh


################# fix git and hostname
# based on in ~/.oh-my-zsh/themes/robbyrussell.zsh-theme
ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[red]%}"
export FPROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}%{$reset_color%}'
# export SPROMPT='%{$fg[cyan]%}%3c %{$fg_bold[blue]%}>$reset_color'
export PROMPT=$FPROMPT

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
#
export EDITOR=vim

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#
# local aliases (don't go to repo)
# [[ -f ~/.local_aliases ]] && . ~/.local_aliases

# no share history between shells
setopt no_share_history
setopt hist_ignore_all_dups

# fix ctrl-u
# http://stackoverflow.com/questions/3483604/which-shortcut-in-zsh-does-the-same-as-ctrl-u-in-bash
bindkey \^U backward-kill-line

######################################################################
###
### tmux
###
######################################################################
# detach other clients
alias tmuxdetacha="tmux detach -a"
# enable copying over x server if DISPLAY is set
# alias tmuxxcopy="tmux source ~/dotfiles/.tmux-linux.conf"

########## ITerm2 autocomplete feature!!! autocompletion by 
# http://blog.plenz.com/2012-01/zsh-complete-words-from-tmux-pane.html
_tmux_pane_words() {
  local expl
  local -a w
  if [[ -z "$TMUX_PANE" ]]; then
    _message "not running inside tmux!"
    return 1
  fi
  w=( ${(u)=$(tmux capture-pane \; show-buffer \; delete-buffer)} )
  _wanted values expl 'words from current tmux pane' compadd -a w
}

zle -C tmux-pane-words-prefix   complete-word _generic
zle -C tmux-pane-words-anywhere complete-word _generic
bindkey '^X^X' tmux-pane-words-prefix
bindkey '^X^T' tmux-pane-words-anywhere
zstyle ':completion:tmux-pane-words-(prefix|anywhere):*' completer _tmux_pane_words
zstyle ':completion:tmux-pane-words-(prefix|anywhere):*' ignore-line current
zstyle ':completion:tmux-pane-words-anywhere:*' matcher-list 'b:=* m:{A-Za-z}={a-zA-Z}'


##############################################
#
### git helpers
#
##############################################

alias gitgrepall='git rev-list --all | xargs git grep'

### git (doing reviews)

# find common ancestor and then do stat or dirf or lg
alias gitreviewstat="git d --stat \`git merge-base master HEAD\`"

alias gitreviewdiff="git d \`git merge-base master HEAD\` $@"

alias gitreviewlg="git lg \`git merge-base master HEAD\`..HEAD -- $@"

### history search
bindkey '\ep' history-beginning-search-backward
bindkey '\en' history-beginning-search-forward

# git recover stash '
alias gitrecover='git l $( git fsck --no-reflog | awk "/dangling commit/ {print \$3}" )'


# git checkout --no-guess (for zsh completions without remote tracking branches!)
# .oh-my-zsh/plugins/gitfast/git-completion.bash:1030 for details
# overwrites gco from git plugin
alias gco='git checkout --no-guess'


#############################################
### ALIASES cd
#############################################
alias cdw='cd ~/work'
#alias psa='ps auxf | grep -v ]$'

#############################################
### ubuntu/centos instaltat shorutcuts
#############################################
# alias ipkg='sudo apt-get install'
# alias ypkg='sudo apt-get install -y'
# alias pkg='apt-cache search'
# alias pkgprovides='dpkg -S '
# alias pkglist='dpkg -L'
#alias ipkg='sudo yum install'
#alias ypkg='sudo yum install -y'
#alias pkg='yum search'
#alias pkgprovides='yum whatprovides'
#alias pkglist='rpm -ql '


############################################
### oh-my-zsh unaliasses
###########################################
# no interactive
unalias rm
unalias cp


###########################################
### watch helper
##########################################
# this one helps to use existings aliases with watch command!
alias watch='watch '


###########################################
### golang
###########################################
#
# export GOROOT=/usr/local/go
# export GOPATH=/home/ppalucki/work/gopath19
# export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"
#export GOROOT=/home/ppalucki/bin/go1.14
#export GOPATH=/home/ppalucki/go
#export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"
#hash -r
##### gvm
# [ -f ~/.gvm/scripts/gvm ] && source ~/.gvm/scripts/gvm
# [ -f ~/bin/setgosrc ] && source ~/bin/setgosrc

# if [ -f ~/bin/setgosrc ]; then
#     # according setgo wg. src /home/ppalucki/src/go
#     # 1.5
#     source setgosrc
# elif [ -f ~/bin/setgo4 ]; then
#     # according setgo14
#     # 1.4
#     source setgo4
# else
#     # default /usr/local/go
#     export GOPATH="~/work/gopath"
#     export GOROOT="/usr/local/go"
#     export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"
# fi
# if [ -f ~/bin/setgo5 ]; then
#     # according setgo
#     # 1.5
#     source setgo5
# elif [ -f ~/bin/setgo4.sh ]; then
#     # according setgo14
#     # 1.4
#     source setgo4
# else
#     # default /usr/local/go
#     export GOPATH="~/work/gopath"
#     export GOROOT="/usr/local/go"
#     export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"
# fi
# if [ -f ~/bin/setgo5 ]; then
#     # according setgo
#     # 1.5
#     source setgo5
# elif [ -f ~/bin/setgo4.sh ]; then
#     # according setgo14
#     # 1.4
#     source setgo4
# else
#     # MacOSX on brew
#     export GOPATH=~/work/gopath
#     # export GOROOT="/usr/local/go"
#     export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"
# fi

#alias cdgo='cd $GOPATH'

## static building
#alias gobuildstatic="CGO_ENABLED=0 go build -a -installsuffix cgo"

## testy - create directory & file and edit
#function testy(){
#    TESTY=$GOPATH/src/testy/
#    mkdir -p $TESTY/$1
#    cd $TESTY/$1
#    touch $1.go
#    vim $1.go
#}

##########################################
#### python
##########################################
# virtualenv wrapper
# [ -f /usr/share/virtualenvwrapper/virtualenvwrapper.sh ] && source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

# pythonz
# https://github.com/saghul/pythonz
# [[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc
# [[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

# pythonbrew
# https://github.com/utahta/pythonbrew
# curl -kL http://xrl.us/pythonbrewinstall | bash
# [[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

##########################################
#### PERL ???? WTF is that
##########################################
# PATH="/home/ppalucki/perl5/bin${PATH+:}${PATH}"; export PATH;
# PERL5LIB="/home/ppalucki/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="/home/ppalucki/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"/home/ppalucki/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/home/ppalucki/perl5"; export PERL_MM_OPT;

#########################################
# noproxy
########################################
alias unsetproxy="unset HTTPS_PROXY HTTP_PROXY http_proxy https_proxy" 

######################################
# autojump manually
####################################
# git clone git://github.com/joelthelion/autojump.git
# https://github.com/wting/autojump#manual
# ./install.py or ./uninstall.py
#[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh

###################################
# ssh agent
#####################################
function sshadd(){
    ssh-add
    ssh-add -l
}
function sshagent(){
    exec /usr/bin/ssh-agent $SHELL
}



### authagent start
# if [ -z "$SSH_AUTH_SOCK" ] ; then
#     eval `ssh-agent -s`
#     ssh-add
# fi


###############################
# k8s 
# #########################
#source <(kubectl completion zsh)
# alias kubectlcompletion="source <(kubectl completion zsh)"
# alias occompletion="source <(oc completion zsh)"
# alias oadmcompletion="source <(oadm completion zsh)"

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#
#
#############################
## pyenv
##########################
# export PATH="/home/ppalucki/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

function cdp(){
    project_name=$1
    tmux rename-window "$project_name"
    wd $project_name
    export PYTHONPATH=.
    if [ -e "Pipfile" ]; then
# . `pipenv --venv`/bin/activate  # commented out by conda initialize
    elif [ -d 'env' ]; then 
# . ./env/bin/activate  # commented out by conda initialize
    fi
}

alias cdowca="cdp owca"
alias cdinst="cdp installer"
# alias cdigkwc="cdp igk-wc-env"
alias cdprm="cdp prm"
#
function yaml2json(){
    python2 -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4);print "\n"'
}



function ssh-copy-id-root {
    target=$1
    cat ~/.ssh/id_rsa.pub  | ssh $target "sudo mkdir /root/.ssh; sudo tee -a /root/.ssh/authorized_keys"
}


# go-jira from netflix
# if [ -x "`command -v jira`" ]; then
#     eval "$(jira --completion-script-zsh)"
# fi
#
#


# HMM - some workaround about not working git co completion !!!!!!!!!!!!!!!!!
#export GIT_COMPLETION_CHECKOUT_NO_GUESS=1
#. ~/git-completion.zsh 2>/dev/null >/dev/null
#kubeoff

# KUSTOMIZE
#alias kak='kubectl apply -k .'
alias kak='kustomize build | kubectl apply -f -'
alias kdelk='kustomize build | kubectl delete -f -'
alias kgk='kustomize build | kubectl get -f -'

alias ssht='ssh -t'

#autoload -U +X bashcompinit && bashcompinit
#complete -o nospace -C /usr/bin/kustomize kustomize

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/usr/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/usr/etc/profile.d/conda.sh" ]; then
#         . "/usr/etc/profile.d/conda.sh"
#     else
#         export PATH="/usr/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<
#
# ####################### VIM MODE
#bindkey -v
# https://superuser.com/questions/351499/how-to-switch-comfortably-to-vi-command-mode-on-the-zsh-command-line
# jj- for exit z insert mode
#bindkey -M viins 'jj' vi-cmd-mode
#
#
function aws-ec2-fingerprint {
    ssh-keygen -f ~/.ssh/id_rsa.pub -e -m PKCS8 | openssl pkey -pubin -outform DER | openssl md5 -c
}

EDITOR=vim
