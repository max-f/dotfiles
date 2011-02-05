#!/usr/bin/env zsh
#-----------------------------------
# file:             .zshrc
# author:           keks
# last modified:    February 2011 
#-----------------------------------
#
# edited version, original file from:
#
#------------------------------------------------------------------#
# File:     .zshrc   ZSH resource file                             #
# Version:  0.1.16                                                 #
# Author:   Ã˜yvind "Mr.Elendig" Heggstad <mrelendig@har-ikkje.net> #
#------------------------------------------------------------------#

#-----------------------------------
# Colors
#-----------------------------------


export CLICOLORS=1
if [ -e /bin/dircolors ]; then
    eval $(dircolors -b ~/.dircolors)
fi

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0222222" #black
    echo -en "\e]P8222222" #darkgrey
    echo -en "\e]P1803232" #darkred
    echo -en "\e]P9982b2b" #red
    echo -en "\e]P25b762f" #darkgreen
    echo -en "\e]PA89b83f" #green
    echo -en "\e]P3aa9943" #brown
    echo -en "\e]PBefef60" #yellow
    echo -en "\e]P4324c80" #darkblue
    echo -en "\e]PC2b4f98" #blue
    echo -en "\e]P5706c9a" #darkmagenta
    echo -en "\e]PD826ab1" #magenta
    echo -en "\e]P692b19e" #darkcyan
    echo -en "\e]PEa1cdcd" #cyan
    echo -en "\e]P7ffffff" #lightgrey
    echo -en "\e]PFdedede" #white

     #this is an attempt at working utf8 line drawing chars in the linux-console
#    export TERM=linux+utf8
    clear #hmm, yeah we need this or else we get funky background collisions
fi

#-----------------------------------
# Aliases
#-----------------------------------

#alias startx='startx > ~/.startx.log 2>&1'
alias ..='cd ..'
alias ...='cd ../..'

alias pacman='sudo pacman'

alias ls='ls -lh --color=auto'
alias lsd='ls -d *(-/N)'      # list visible directories
alias lsf='ls *(-.N)'         # list visible files

alias df='df -H'
alias zshrc='. ~/.zshrc && echo "reload ~/.zshrc								${txtblu}[${txtwht}DONE${txtblu}]"'
alias dmtail='dmesg | tail -n 15'
alias netcfg-menu='sudo netcfg-menu'
alias netcfg='sudo netcfg2'
alias sumc='su -c mc'
alias startssh='/usr/local/bin/startssh'
alias mtr='mtr --curses'
alias grep='grep --colour=auto'
alias osp='/opt/quake3/ioquake3.x86_64 +set fs_game osp'
alias cpma='/opt/quake3/ioquake3.x86_64 +sef fs_game cpma'
#alias osp='/usr/local/games/quake3/quake3 +set fs_game osp'
#alias cpma='/usr/local/games/quake3/quake3 +set fs_game cpma'
#alias bp='sshfs keks@brechpunkt.de:/home/keks -o nonempty ~/brechpunkt/'

alias pacs='pacman -Ss'
alias paci='pacman -S'
alias pacqi='pacman -Qi'
alias pacsi='pacman -Si'
alias pacl='pacman -Ql'
alias pacr='pacman -Rs'
alias pacy='pacman -Sy'
alias pacu='pacman -Syu'
 
alias S='sudo'

alias dropup="sh $HOME/devel/bash/dropbox.sh up"
alias dropdown="sh $HOME/devel/bash/dropbox.sh down"

alias -s {mp3,avi,mpeg,mpg,ogg}=mplayer
alias -s html=$BROWSER
alias -s htm=$BROWSER
alias -s {c,py,java,cfg}=$EDITOR
#alias -s h=$EDITOR
#alias -s cpp=$EDITOR
#alias -s hs=$EDITOR
alias -s pdf=evince
alias -s {png,jpg,JPG,JPEG,PNG}='feh -dF'
alias -s pls=audacious

alias -g L='|less'
alias -g G='|grep'

#-----------------------------------
# History
#-----------------------------------

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

#-----------------------------------
# Variables
#-----------------------------------

setopt extendedglob appendhistory autocd nomatch
unsetopt beep

export PATH=$PATH:~/bin:/usr/local/bin:
export EDITOR='vim'
export BROWSER='firefox'
export OOO_FORCE_DESKTOP=gnome
export MAIL=~/mail
export ECLIM_ECLIPSE_HOME="/usr/share/eclipse"
export PAGER='vimpager'

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#-----------------------------------
# Keybindings
#-----------------------------------

bindkey -v
typeset -g -A key
#bindkey '\e[3~' delete-char
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
#bindkey '\e[2~' overwrite-mode
bindkey '^?' backward-delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[4~' end-of-line
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char 
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for gnome-terminal
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line

#-----------------------------------
# Completion
#-----------------------------------

zmodload zsh/complist 
autoload -Uz compinit
compinit
zstyle :compinstall filename '${HOME}/.zshrc'

zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

#-----------------------------------
# Window title
#-----------------------------------


if [ $TERM = xterm ] || [ $TERM = rxvt-unicode ] || [ $TERM = rxvt-256color ]; then
        precmd () { print -Pn "\e]0;%~\a" }
        preexec () { print -Pn "\e]0;$1\a" } 
fi

#-----------------------------------
# Prompt
#-----------------------------------

setprompt () {
    # load some modules
    autoload -U colors zsh/terminfo # Used in the colour alias below
    colors
    setopt prompt_subst

    # make some aliases for the colours: (coud use normal escap.seq's too)
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
        eval PR_$color='%{$fg[${(L)color}]%}'
    done
    PR_NO_COLOR="%{$terminfo[sgr0]%}"

    # Check the UID
    if [[ $UID -ge 1000 ]]; then # normal user
        eval PR_USER='${PR_MAGENTA}%n${PR_NO_COLOR}'
        eval PR_USER_OP='${PR_MAGENTA}\$${PR_NO_COLOR}'
    elif [[ $UID -eq 0 ]]; then # root
        eval PR_USER='${PR_RED}%n${PR_NO_COLOR}'
        eval PR_USER_OP='${PR_RED}%#${PR_NO_COLOR}'
    fi  

    # Check if we are on SSH or not
    if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then 
        eval PR_HOST='${PR_YELLOW}%M${PR_NO_COLOR}' #SSH
        eval PR_HOSTCOL='${PR_YELLOW}'
    else 
        eval PR_HOST='${PR_GREEN}%M${PR_NO_COLOR}' # no SSH
        eval PR_HOSTCOL='${PR_GREEN}'
    fi

    # set the prompt
    PS1="${PR_HOSTCOL}______________________________________________
${PR_USER}${PR_CYAN}@${PR_HOST} ${PR_BLUE}%~ ${PR_USER_OP} "
    PS2=$'%_>'
}
setprompt

#-----------------------------------
# Functions
#-----------------------------------

# Usage: simple-extract <file>
# Description: extracts archived files (maybe)
simple-extract () 
{
if [[ -f "$1" ]]
then
	case "$1" in
#		*.tar.bz2)  bzip2 -v -d "$1" ;;
		*.tar.bz2)  tar xvjf "$1" 	 ;;
		*.tar.gz)   tar -xvzf "$1"   ;;
		*.ace)      unace e "$1"     ;;
		*.rar)      unrar x "$1"     ;;
		*.deb)      ar -x "$1"       ;;
		*.bz2)      bzip2 -d "$1"    ;;
		*.lzh)      lha x "$1"       ;;
		*.gz)       gunzip -d "$1"   ;;
		*.tar)      tar -xvf "$1"    ;;
		*.tgz)      gunzip -d "$1"   ;;
		*.tbz2)     tar -jxvf "$1"   ;;
		*.zip)      unzip "$1"       ;;
		*.Z)        uncompress "$1"  ;;
		*.shar)     sh "$1"          ;;
		*)          echo "'"$1"' Error. Please go away" ;;
	esac
else
	echo "'"$1"' is not a valid file"
fi
}

# Usage: smartcompress <file> (<type>)
# Description: compresses files or a directory.  Defaults to tar.gz
smartcompress()
{
if [ '$2' ];
then
	case '$2' in
		tgz | tar.gz)   tar -zcvf$1.$2 '$1' ;;
		tbz2 | tar.bz2) tar -jcvf$1.$2 '$1' ;;
		tar.Z)          tar -Zcvf$1.$2 '$1' ;;
		tar)            tar -cvf$1.$2  '$1' ;;
		gz | gzip)      gzip           '$1' ;;
		bz2 | bzip2)    bzip2          '$1' ;;
		*)
	echo "Error: $2 is not a valid compression type" ;;
	esac
else
	smartcompress '$1' tar.gz
fi
}

# Usage: show-archive <archive>
# Description: view archive without unpack
show-archive()
{
if [[ -f $1 ]]
then
	case $1 in
		*.tar.gz)      gunzip -c $1 | tar -tf - -- ;;
		*.tar)         tar -tf $1 ;;
		*.tgz)         tar -ztf $1 ;;
		*.zip)         unzip -l $1 ;;
		*.bz2)         bzless $1 ;;
		*)             echo "'$1' Error. Please go away" ;;
	esac
else
	echo "'$1' is not a valid archive"
fi
}

# Usage: q3demo <demofile>
# Description: plays a .dm_68 file in q3 with cpma
q3demo () {
cp $1 ~/.q3a/cpma/demos/demoplay.dm_68
/usr/local/bin/quake3 +set fs_Game cpma +demo demoplay
rm ~/.q3a/cpma/demos/demoplay.dm_68
}

