# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

export FLEX_HOME="$HOME/work/sdks/3.5.0"
alias FANT="ant -DFLEX_HOME=$FLEX_HOME"
alias cdhh='cd $HADOOP_HOME'
alias cdhue='cd $HOME/opsaps/repo.d/hue'
alias cdaps='cd $HOME/opsaps'
alias h_start='./repo.d/hue/tools/scripts/configure-hadoop.sh start'
alias h_stop='./repo.d/hue/tools/scripts/configure-hadoop.sh stop'
alias hue_start='DESKTOP_DEPENDER_DEBUG=1 ./repo.d/hue/build/env/bin/hue runserver_plus'
alias hue_job='./repo.d/hue/build/env/bin/hue subjobd'
alias hue_ugm='./repo.d/hue/build/env/bin/hue userman_user_group_manager'
alias auth_tests='~/opsaps/repo.d/hue/build/env/bin/hue test specific userman.tests --pdb --pdb-failure -s'

export HADOOP_HOME=$HOME/hadoop-0.20.2+737
export PATH=$HOME/crepo:$PATH

function parse_git_branch
{
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

parse_svn_revision() {
        local DIRTY REV=$(svn info 2>/dev/null | grep Revision | sed -e 's/Revision: //')
        [ "$REV" ] || return
        [ "$(svn st)" ] && DIRTY=' *'
        echo "(r$REV$DIRTY)"
}
function gvim { /Applications/MacVim.app/Contents/MacOS/Vim -g $*; } 

PS1='\u@\h:\w $(parse_git_branch)$(parse_svn_revision)\$ '

function desktop-review { 
    if [ $# -lt 3 ]; then
        echo "Usage: desktop-review rev-list reviewer summary ...";
        return;
    fi;
    REVLIST=$1;
    REVIEWER=$2;
    SUMMARY=$3;
    shift 3;
    post-review --description="$(git whatchanged $REVLIST)" --target-groups=auth_apps --target-people="$REVIEWER" --diff-filename=<(git diff "$REVLIST") --summary="$SUMMARY" $@
}
export PATH=/usr/local/mysql-5.5.8-osx10.6-x86_64/bin:$PATH
