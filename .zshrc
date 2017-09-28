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
plugins=(gitfast autojump command-not-found common-aliases docker tmux history wd systemd golang)


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
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

source $ZSH/oh-my-zsh.sh


################# fix git and hostname
# based on in ~/.oh-my-zsh/themes/robbyrussell.zsh-theme
ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[red]%}"
FPROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} %{$reset_color%}'
export SPROMPT='%{$fg[cyan]%}%3c %{$fg_bold[blue]%}> $reset_color'
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
[[ -f ~/.local_aliases ]] && . ~/.local_aliases

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
alias tmuxxcopy="tmux source ~/dotfiles/.tmux-linux.conf"

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
bindkey '^Xt' tmux-pane-words-prefix
bindkey '^X^X' tmux-pane-words-anywhere
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
alias psa='ps auxf | grep -v ]$'

#############################################
### ubuntu/centos instaltat shorutcuts
#############################################
# alias ipkg='sudo apt-get install'
# alias ypkg='sudo apt-get install -y'
# alias pkg='apt-cache search'
# alias pkgprovides='dpkg -S '
# alias pkglist='dpkg -L'
alias ipkg='sudo yum install'
alias ypkg='sudo yum install -y'
alias pkg='yum search'
alias pkgprovides='yum whatprovides'
alias pkglist='rpm -ql '


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
##### gvm
[ -f ~/.gvm/scripts/gvm ] && source ~/.gvm/scripts/gvm
[ -f ~/bin/setgosrc ] && source ~/bin/setgosrc

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

alias cdgo='cd $GOPATH'

## static building
alias gobuildstatic="CGO_ENABLED=0 go build -a -installsuffix cgo"

## testy - create directory & file and edit
function testy(){
    TESTY=$GOPATH/src/testy/
    mkdir -p $TESTY/$1
    cd $TESTY/$1
    touch $1.go
    vim $1.go
}

##########################################
#### python
##########################################
# virtualenv wrapper
[ -f /usr/share/virtualenvwrapper/virtualenvwrapper.sh ] && source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

# pythonz
# https://github.com/saghul/pythonz
# [[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

# pythonbrew
# https://github.com/utahta/pythonbrew
# curl -kL http://xrl.us/pythonbrewinstall | bash
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

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
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh


###################################
# ssh agent
#####################################
function sshagent(){
    exec /usr/bin/ssh-agent $SHELL
}

function sshadd(){
    ssh-add
    ssh-add -l
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
alias kubectlcompletion="source <(kubectl completion zsh)"

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#
#
#############################
## pyenv
##########################
# export PATH="/home/ppalucki/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"


function s3(){
    . ~/envs/s3/bin/activate
    wd s3
    export PYTHONPATH=.
}


function ssh-copy-id-root {
    target=$1
    cat ~/.ssh/id_rsa.pub  | ssh $target "sudo mkdir /root/.ssh; sudo tee -a /root/.ssh/authorized_keys"
}
