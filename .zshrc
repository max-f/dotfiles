#!/usr/bin/env zsh
#-----------------------------------
# file:             .zshrc
# author:           keks
# last modified:    April 2011
#-----------------------------------

#-----------------------------------
# Colors
#-----------------------------------
# {{{

GREP_COLORS="38;5;230:sl=38;5;240:cs=38;5;100:mt=38;5;161;1:fn=38;5;197:ln=38;5;212:bn=38;5;44:se=38;5;166"
export ACK_COLOR_MATCH="cyan bold"
export ACK_COLOR_FILENAME="cyan bold on_black"
export ACK_COLOR_LINENO="bold green"

#export CLICOLORS=1
if [ -e /bin/dircolors ]; then
    eval $(dircolors -b ~/.dircolors)
fi

export LS_COLORS GREP_COLORS

# }}}

#-----------------------------------
# Aliases
#-----------------------------------
# {{{

source $HOME/.zsh/alias.zsh

# }}}

#-----------------------------------
# History
#-----------------------------------
# {{{

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# }}}

#-----------------------------------
# Variables
#-----------------------------------
# {{{

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

# }}}

#-----------------------------------
# Keybindings
#-----------------------------------
# {{{

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

# }}}

#-----------------------------------
# Completion
#-----------------------------------
# {{{

zmodload zsh/complist
autoload -Uz compinit
compinit
zstyle :compinstall filename '${HOME}/.zshrc'

zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"

zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

# }}}

#-----------------------------------
# Window title
#-----------------------------------
# {{{

if [ $TERM = xterm ] || [ $TERM = rxvt-unicode ] || [ $TERM = rxvt-256color ]; then
        precmd () { print -Pn "\e]0;%~\a" }
        preexec () { print -Pn "\e]0;$1\a" } 
fi

# }}}

#-----------------------------------
# Prompt
#-----------------------------------
# {{{

# Set the prompt.
setprompt() {
    # Initialize colors.
    autoload -U colors
    colors

    # Allow for functions in the prompt.
    setopt PROMPT_SUBST

    # Autoload zsh functions.
    fpath=(~/.zsh/git_prompt_functions $fpath)
    autoload -U ~/.zsh/git_prompt_functions/*(:t)

    # Enable auto-execution of functions.
    typeset -ga preexec_functions
    typeset -ga precmd_functions
    typeset -ga chpwd_functions

    # Append git functions needed for prompt.
    preexec_functions+='preexec_update_git_vars'
    precmd_functions+='precmd_update_git_vars'
    chpwd_functions+='chpwd_update_git_vars'


    # make some aliases for the colours: (coud use normal escap.seq's too)
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
        eval PR_$color='%{$fg[${(L)color}]%}'
    done
    PR_NO_COLOR="%{$terminfo[sgr0]%}"

    # Check the UID
    if [[ $UID -ge 1000 ]]; then # normal user
        eval PR_USER='${PR_MAGENTA}%n${PR_NO_COLOR}'
        eval PR_USER_OP='${PR_MAGENTA}➜${PR_NO_COLOR}'
    elif [[ $UID -eq 0 ]]; then # root
        eval PR_USER='${PR_RED}%n${PR_NO_COLOR}'
        eval PR_USER_OP='${PR_RED}%#${PR_NO_COLOR}'
    fi  

    # Check if we are on SSH or not
    if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then 
        eval PR_HOST='${PR_YELLOW}%M${PR_NO_COLOR}' #SSH
    else 
        eval PR_HOST='${PR_GREEN}%M${PR_NO_COLOR}' # no SSH
    fi

    # set the prompt
    PROMPT="${PR_USER}${PR_CYAN}@${PR_HOST} ${PR_WHITE}[${PR_BLUE}%B%~%b${PR_WHITE}]"'$(prompt_git_info)'" ${PR_USER_OP} "
    RPROMPT="${PR_WHITE}[${PR_YELLOW}%?${PR_WHITE}]${PR_NO_COLOR}"
    #PS2=$'%_>'
}
setprompt

# }}}

#-----------------------------------
# Functions
#-----------------------------------
# {{{

source $HOME/.zsh/functions.zsh

# }}}
