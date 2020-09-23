# possible issues
# - [[ versus [

# ~/.bashrc: executed by bash(1) for non-login shells.

# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
#HISTCONTROL=ignoreboth
export HISTCONTROL=ignoredups:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color) color_prompt=yes;;
#esac

## If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac

# disable exiting on pressing Ctrl-D once (exits when pressed IGNOREEOF times)
export IGNOREEOF=5
 
# disable freezing
stty stop ''
stty start ''
stty -ixon
stty -ixoff

#eval $(dircolors -b ~/.dir_colors)
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias hir='history -r'
alias rm='rm -i'
alias lf='ls -B' # list files (and folders)
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias won='trash'

alias xterm='xterm -maximized'
alias trim="sed -e 's/^[[:space:]]*//g' -e 's/[[:space:]]*\$//g'"
alias tree="tree -I '*~'"
alias v='vim'
alias py='ipython'

g() {
    if [[ $@ == "s" ]]; then
        command git status
    else
        command git "$@"
    fi
}

venv() {
    if [[ $@ == "mne" ]]; then
        command source $HOME/P/mnemonic_playground/venv-mnemonic-python3.5.new/bin/activate
    elif [[ $@ == "pubqc" ]]; then
        command source $HOME/P/playground/venv-pubqc/bin/activate
    elif [[ $@ == "pubqc-stable" ]]; then
        command source $HOME/P/playground/venv-pubqc-stable/bin/activate
    else
        command venv
    fi
}

ra() {
    command radian
    }


#if [[ -f ~/.bin/py_utils.py ]]; then
#    alias ipython3="ipython3 -i ~/.bin/py_utils.py"
#    alias ipython2="ipython2 -i ~/.bin/py_utils.py"
#    alias ipython="ipython -i ~/.bin/py_utils.py"
#
#    alias ipython3_bare="ipython3"
#    alias ipython2_bare="ipython2"
#    alias ipython_bare="ipython"
#fi

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# set additional PATHs
if [ -d $HOME/bin ]; then
    export PATH=$PATH:$HOME/bin
fi

if [ -d $HOME/.bin ]; then
    export PATH=$PATH:$HOME/.bin
fi

if [ -d $HOME/.local/.bin ]; then
    export PATH=$PATH:$HOME/.local/.bin
fi

if [ -d $HOME/.local/bin ]; then
    export PATH=$PATH:$HOME/.local/bin
fi

#####
#BLACK='\[\033[38;5;000m\]'
#RED='\[\033[38;5;161m\]'
#GREEN='\[\033[38;5;047m\]'
#YELLOW='\[\033[38;5;228m\]'
#BLUE='\[\033[38;5;069m\]'
#PURPLE='\[\033[38;5;099m\]'
#CYAN='\[\033[38;5;045m\]'
#WHITE='\[\033[38;5;015m\]'
#COLOR_RESET='\[\033[00m\]'

  
BLACK='\[\e[1;30m\]'
RED='\[\e[1;31m\]'
GREEN='\[\e[1;32m\]'
YELLOW='\[\e[1;33m\]'
BLUE='\[\e[1;34m\]'
PURPLE='\[\e[1;35m\]'
CYAN='\[\e[1;36m\]'
WHITE='\[\e[1;37m\]'
COLOR_RESET='\[\033[00m\]'

TERM=screen-256color

##if [ "$TERM" == "screen" ]; then
##    PS1="$BLUE\w $GREEN\$ $COLOR_RESET"
##else
#    PS1="$YELLOW\h $BLUE\w$PURPLE\$(__git_ps1)$YELLOW \$ $COLOR_RESET"
##fi

export PS1="$YELLOW\h $BLUE\w$YELLOW \$ $COLOR_RESET"

#put prompt in the last line (bottom of window)
#TOLASTLINE=$(tput cup "$LINES")
#export PS1="\[$TOLASTLINE\]$PS1"

#export TERM=xterm-color # scala interpreter needs this for some reason https://github.com/lihaoyi/mill/issues/139
#export TERM=screen-256color

if [ -f $HOME/.Xdefaults ]; then
  xrdb -merge $HOME/.Xdefaults
fi

# file in Dropbox folder will be shared immediately. Play around?

### python
# add my py_scripts to python module search path
#export PYTHONPATH="$PYTHONPATH:$HOME/.bin:/P/mnemonic-old"
#export FLASK_APP='/P/errco-stable/errco/__init__.py'
#export FLASK_DEBUG=true
unset PYTHONPATH
#export PYTHONPATH= "/tmp/packerbuild-1000/miniconda3/miniconda3/pkg/miniconda3/opt/miniconda3"


### git-completion
# copied from /etc/bash_completion.d/git-prompt

# In git versions < 1.7.12, this shell library was part of the
# git completion script.
#
# Some users rely on the __git_ps1 function becoming available
# when bash-completion is loaded.  Continue to load this library
# at bash-completion startup for now, to ease the transition to a
# world order where the prompt function is requested separately.
#
if [[ -e /usr/lib/git-core/git-sh-prompt ]]; then
    . /usr/lib/git-core/git-sh-prompt
fi

if [[ -f $HOME/.git_completion.sh ]]; then
	source $HOME/.git_completion.sh
fi

if [[ -f $HOME/.git_prompt.sh ]]; then
	source $HOME/.git_prompt.sh
fi

### Windows manager and keyboard

if [[ -f $HOME/.my_keymap ]]; then
    loadkeys $HOME/.my_keymap
fi


