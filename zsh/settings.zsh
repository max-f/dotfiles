#!/usr/bin/env zsh
#----------------------------------------------------
# Author:       Max "keks" Fischer
#
# File:         settings.zsh
#----------------------------------------------------

#-----------------------------------
# Colors
#-----------------------------------
# {{{
if [[ "$TERM" != "linux" ]]; then
	export GREP_COLORS='38;5;230:sl=38;5;240:cs=38;5;100:mt=38;5;85;1:fn=38;5;86:ln=38;5;212:bn=38;5;44:se=38;5;166'
fi
export ACK_COLOR_MATCH="cyan bold"
export ACK_COLOR_FILENAME="cyan bold on_black"
export ACK_COLOR_LINENO="bold green"
export HOSTNAME="$HOST"

#export CLICOLORS=1
if [[ -e /usr/bin/dircolors ]]; then
    eval $(dircolors -b ~/.dircolors)
elif [[ "$TERM" = "linux" ]]; then
	export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'
fi

# Base16 stuff
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
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
# Variables & Options
#-----------------------------------
# {{{

unsetopt beep

setopt inc_append_history
setopt no_bg_nice
setopt share_history
setopt extended_history
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt nohistverify
setopt prompt_subst
setopt always_to_end

export PATH=/home/${USER}/bin:$PATH
export PYTHONPATH=/home/${USER}/.local/lib
export EDITOR='vim'
export BROWSER='firefox'
#export TERM='rxvt-unicode'
export OOO_FORCE_DESKTOP=gnome
export MAIL=~/mail
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
export PAGER='less'

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
## commented out due to oh-my-zsh plugins
# bindkey -v
# typeset -g -A key
# #bindkey '\e[3~' delete-char
# bindkey '\e[1~' beginning-of-line
# bindkey '\e[4~' end-of-line
# #bindkey '\e[2~' overwrite-mode
# bindkey '^?' backward-delete-char
# bindkey '^[[1~' beginning-of-line
# bindkey '^[[5~' up-line-or-history
# bindkey '^[[3~' delete-char
# bindkey '^[[4~' end-of-line
# bindkey '^[[6~' down-line-or-history
# bindkey '^[[A' up-line-or-search
# bindkey '^[[D' backward-char
# bindkey '^[[B' down-line-or-search
# bindkey '^[[C' forward-char 
# # for rxvt
# bindkey "\e[8~" end-of-line
# bindkey "\e[7~" beginning-of-line
# # for gnome-terminal
# bindkey "\eOH" beginning-of-line
# bindkey "\eOF" end-of-line
# 
# # search through history by using up and down arrows and put cursor at the EOL
# autoload -U history-search-end
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end
# bindkey "^[[A" history-beginning-search-backward-end
# bindkey "^[[B" history-beginning-search-forward-end
# }}}

#-----------------------------------
# History
#-----------------------------------
# {{{
#export HOSTNAME_SHORT="${HOSTNAME%%.*}"
#export HISTFILE="${HOME}/.history/$(date -u +%Y/%m/%d.%H.%M.%S)_${HOSTNAME_SHORT}_$$"
HISTFILE="$HOME"/.zsh_history
HISTSIZE=10000
SAVEHIST=5000000
# }}}

#-----------------------------------
# z to jump around
#-----------------------------------
# {{{
. /usr/bin/z.sh
# }}}
