# ~/.bashrc: executed by bash(1) for non-login shells.

#############################
### UBUNTU default
#############################
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#############################
### UBUNTU prompt default
#############################
# # set variable identifying the chroot you work in (used in the prompt below)
# if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
#     debian_chroot=$(cat /etc/debian_chroot)
# fi
# 
# # set a fancy prompt (non-color, unless we know we "want" color)
# case "$TERM" in
#     xterm-color) color_prompt=yes;;
# esac
# 
# # uncomment for a colored prompt, if the terminal has the capability; turned
# # off by default to not distract the user: the focus in a terminal window
# # should be on the output of commands, not on the prompt
# #force_color_prompt=yes
# 
# if [ -n "$force_color_prompt" ]; then
#     if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
# 	# We have color support; assume it's compliant with Ecma-48
# 	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
# 	# a case would tend to support setf rather than setaf.)
# 	color_prompt=yes
#     else
# 	color_prompt=
#     fi
# fi
# 
# if [ "$color_prompt" = yes ]; then
#     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# else
#     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi
# unset color_prompt force_color_prompt
# 
# # If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#     ;;
# *)
#     ;;
# esac

#############################
### UBUNTU ls aliases and colors
#############################
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


###########################################
### MOJE INCLUDY
###########################################
# alias tylko w firmie Redefine
# glownie na host i zwiazanie z projektami
if [ -f ~/.bash_redefine_aliases ]; then
    . ~/.bash_redefine_aliases
fi


#############################################
## VIRUTAL ENV WRAPPER
#############################################
# http://virtualenvwrapper.readthedocs.org/en/latest/command_ref.html
source /usr/local/bin/virtualenvwrapper.sh


###############################
#### PS1 (git - current branch) 
###############################
### GIT and ps
current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# export PS1="\u@\h:\w\$(parse_git_branch)$ "
# (venv)blue(path)branch(red)$
PS1='\[\033[01;34m\]\w\[\033[01;32m\]$(parse_git_branch)\[\033[01;31m\]$\[\033[00m\] '


###############################
### bash history
###############################
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=10000
export HISTFILESIZE=5000000
export HISTCONTROL=ignoreboth:erasedups # no duplicate entries
# trick from http://unix.stackexchange.com/questions/48111/real-time-history-export-amongst-bash-terminal-windows#3055135
# append to the history file, don't overwrite it
shopt -s histappend                      # append to history, don't overwrite it
# 10000 unique bash history lines that are shared between 
# sessions on every command. Happy ctrl-r!!
# Save and reload the history after each command finishes
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
#HISTCONTROL=ignoreboth


###############################
### VIM: default editor
###############################
export EDITOR=vim
# vim for psql
export PSQL_EDITOR="vi -c 'setf sql'"


###############################
### Ruby optimizationis
# http://snaprails.tumblr.com/post/241746095/rubys-gc-configuration
# http://lightyearsoftware.com/2012/11/speed-up-mri-ruby-1-9/
###############################
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_HEAP_FREE_MIN=500000


###############################
### IMPORTANT !!!!!
### GetMedia: default editor
### FIX na wgrywanie paczek
###############################
umask 022


#################################333
### KEYBOARD customization
### xmodmap
### WARN: xkb is now in use so
### learn /usr/share/X11/xkb
### http://www.charvolant.org/~doug/xkb/html/index.html
# mozna zamienic na xmodmap ~/.Xmodmap
###############################k
### capslock as enter
# ESCAPE_KEYCODE=9
# CAPS_KEYCODE=66
# LCONTROL_KEYCODE=37
# SPACE=65
# 
# requiers: Keyboard Layout -> Options -> Caps Lock bey beahavior -> Caps Lock is disabled
# vi /usr/include/X11/keysymdef.h
# 
xmodmap -e 'keycode 66 = Return NoSymbol Return'
# space after press and release 

# na jakis 
# xmodmap -e 'keycode 255 = space NoSymbol space'
# xmodmap -e 'keycode 65 = Control_L NoSymbol Control_L'
# xcape -d -e "#65=space"

# # Make caps as control and escape at the same time. Based on super-caps by cmatheson.
# xmodmap -e "clear Lock"
# xmodmap -e "keycode $CAPS_KEYCODE = Control_L"
# xmodmap -e "add Control = Control_L"
# xmodmap -e "keysym Escape = Caps_Lock"
# xmodmap -e "add Lock = Caps_Lock"
# xmodmap -e "keycode 999 = Escape"
# xcape -e "Control_L=Escape"
# # Maps escape and left control to no-op.
# xmodmap -e "keycode $ESCAPE_KEYCODE ="
# xmodmap -e "keycode $LCONTROL_KEYCODE ="

### menu as Super_L
# Keyboard layout options i ustaw sobie alt/win keybeh na "Alt is mapped to Right Win, Super To Menu" -?!??!!??! 

### !Swap right control and right alt
# 108 - to fizyczny prawy Alt
# 105 - to fizyczny prawy Ctrl
xmodmap -e 'remove control = Control_R'
# xmodmap -e 'remove mod1 = Alt_R' # bo i tak tego nie uzywam

# do "fizycznego prawego Ctrl przypisalemy ISO_Level3_Shift"
xmodmap -e 'keycode 105 = ISO_Level3_Shift NoSymbol ISO_Level3_Shift'
# do "fizycznego prawego Alt - przypisymeny Control_R'
xmodmap -e 'keycode 108 = Control_R'

xmodmap -e 'add control = Control_R'
# xmodmap -e 'add mod1 = Alt_R'

### Menu button acts as Super
# ale nie dziala tylko xmodmap - musi dzias sie cos jeszcze !!!
# to samo co Keyboard Layout -> Options -> Alt/Win behvior -> 'Alt is mapped to RightWind, Super to Menu'
# 135 - to przycisk Menu i bedzie teraz oznacza Super czyli pokazniae mnue
# xmodmap -e 'keycode 134 = Alt_R Meta_R Alt_R Meta_R'
# xmodmap -e 'keycode 135 = Super_R NoSymbol Super_R'

# alt-n/alt-p history-search-backwad/forward'
bind '"\ep":history-search-backward'
bind '"\en":history-search-forward'

### podpiecie shrtcuta ktory znika
# gconf editor
# gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Alt>F11']"
# dconf - media keys
### alt-q browser
# dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/binding "'<Alt>q'"
### alt-w terminal
# dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/binding "'<Alt>w'"

########################################
## UTILITY FUNCTIONS
########################################
function title {
echo -en "\033]2;$1\007"
}

########################################
### vrome deamon start
########################################
# start-stop-daemon --start --background --exec /usr/local/bin/vrome &>/dev/null
vromed


###############################
### PYTHONZ
###############################
# pythonz
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc


###############################
### IPYTHON as shell
###############################
# ipython profile create pysh
alias pysh="ipython --profile=pysh"


###############################
### PYTHON 
###############################
export PYTHON_EGG_CACHE=/home/ppalucki/.python-eggs
### python xtraceback 
export XTB=0


################################
# JAVA SCRIPT Node
################################
# jsctags
NODE_PATH='/usr/local/lib/jsctags:${NODE_PATH}'


################################
# HASKELL/CABAL
################################
# export PATH=~/bin/scala-2.10.1/bin:$PATH
export PATH=$PATH:~/src/fslint-2.42/fslint/:/home/ppalucki/.cabal/bin


################################
# RUBY RVM
################################
### PATH
#export PATH=$PATH:$HOME/bin
#export PATH=$HOME/.rvm/rubies/ruby-1.9.3-p125-perf/bin:$PATH
#export PATH=$HOME/.rvm/gems/ruby-1.9.3-p125-perf/bin:$PATH
#export PATH=$HOME/.rvm/gems/ruby-1.9.3-p125-perf@global/bin:$PATH
###export PATH=$HOME/src/mongodb-linux-i686-2.0.4/bin/:$PATH
### init rvm
### RVM & ruby
#rvm_path=/home/ppalucki/.rvm
#GEM_PATH=/home/ppalucki/.rvm/gems/ruby-1.9.3-p125-perf:/home/ppalucki/.rvm/gems/ruby-1.9.3-p125-perf@global
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
##P#ATH=$PATH:$HOME/.rvm/bin:~/bin # Add RVM to PATH for scripting
source ~/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### ??!
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

################################
# GOlang
################################
export PATH=$PATH:/usr/local/go/bin

