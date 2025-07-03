#!/usr/bin/env zsh

# check if $1 exists
function command_exists() {
    type -p "$1" &> /dev/null
}


#alias startx='startx > ~/.startx.log 2>&1'
alias ..='cd ..'
alias ...='cd ../..'

if command_exists eza; then
    # Basic listing with file type indicators
    alias l='eza -F --group-directories-first --icons'
    # Long format with git info and grouped directories
    alias ll='eza -lgF --git --group-directories-first --icons'
    # All files including hidden, long format
    alias la='eza -lagF --git --group-directories-first'
    # Tree view with limited depth and color scale
    alias lt='eza --tree --color-scale -L 3'
    alias ltl='eza --tree --long --color-scale -L 3 --icons'
    # Show only directories
    alias ld='eza -lDF --git'
    # Sort by modification time (newest first)
    alias lm='eza -lgF --git --sort=modified --reverse'
    # Sort by size (largest first)  
    alias ls='eza -lgF --git --group-directories-first --sort=size --reverse'

	# Show recent files (last 20 modified, non-hidden only)
    #alias lr='eza -lgF --git --sort=modified --icons *(om[1,20])'
    # Show recent files including hidden (last 20 modified, all files)
    #alias lra='eza -lgF --git --sort=modified *(D.om[1,20])'
	# Show recent files (last 20 modified, non-hidden only)
	alias lr='eza -lgF --git --sort=none --icons *(.om[1,20])'
    # Show recent files including hidden (last 20 modified, all files)
	alias lra='eza -lgF --git --sort=none --icons *(D.om[1,20])'

    # Quick file count in directory
    alias lc='eza -1 | wc -l'
    # Show file permissions clearly
    alias lp='eza -lgF --git --no-user --no-time'
fi

# Fallback ls aliases (when eza not available)
if ! command_exists eza; then
    alias l='ls -hF --group-directories-first --color=auto'
    alias ll='ls -lhF --group-directories-first --color=auto'
    alias la='ls -lahF --group-directories-first --color=auto'
    alias lt='tree -C -L 3'  # requires tree command
    alias ld='ls -lhd */ 2>/dev/null'
    alias lm='ls -lhFt --group-directories-first --color=auto'
fi

# Universal aliases (work with both ls and eza)
# List only visible directories
alias lsd='ls -d *(-/N) 2>/dev/null'
# List only visible files
alias lsf='ls *(-.N) 2>/dev/null'
# List symlinks
alias lsl='ls -l *(@) 2>/dev/null'

# better ask before we lose data
alias rm='rm -Iv'
alias cp='cp -riv'
alias mv='mv -iv'
alias mkdir='mkdir -vp'

#alias gitui='gitui -t macchiato'
alias bat='bat --theme="Solarized (light)"'
alias glow='glow --style dark'
alias cower='cower --color=auto'
alias df='df -H'
alias zshrc='. ~/.zshrc && echo "reload ~/.zshrc								${txtblu}[${txtwht}DONE${txtblu}]"'
alias dmtail='dmesg | tail -n 15'
#alias netcfg-menu='sudo netcfg-menu'
#alias netcfg='sudo netcfg'
alias startssh='/usr/local/bin/startssh'
alias mtr='mtr --curses'
alias grep='grep --colour=auto'
alias osp='/opt/quake3/ioquake3.x86_64 +set fs_game osp'
alias cpma='/opt/quake3/ioquake3.x86_64 +sef fs_game cpma'
#alias osp='/usr/local/games/quake3/quake3 +set fs_game osp'
#alias cpma='/usr/local/games/quake3/quake3 +set fs_game cpma'
alias qldelay-on='S tc qdisc add dev eth0 root netem delay 15ms'
alias qldelay-off='S tc qdisc del dev eth0 root'
alias ipython='ipython3'

# SSH with alacritty (no need for terminfo on remote)
alias ssh='TERM=xterm-256color ssh'


# pacman
alias pacman='sudo pacman'

alias pacs='pacman -Ss'
alias paci='pacman -S'
alias pacqi='pacman -Qi'
alias pacsi='pacman -Si'
alias pacl='pacman -Ql'
alias pacr='pacman -Rs'
alias pacy='pacman -Sy'
alias pacu='pacman -Syu'

alias S='sudo'
alias v='nvim'
alias protonvpn='sudo protonvpn'

# dropbox
alias dropup="sh $HOME/devel/bash/dropbox.sh up"
alias dropdown="sh $HOME/devel/bash/dropbox.sh down"

# handling certain filetypes
alias -s {mp3,avi,mpeg,mpg,ogg}=mpv
alias -s pls='mpv --playlist'
alias -s {htm,html}=$BROWSER
alias -s {c,cpp,py,java,cfg}=$EDITOR
#alias -s h=$EDITOR
#alias -s hs=$EDITOR
alias -s {djvu,pdf}=evince
alias -s {png,jpg,jpeg,JPG,JPEG,PNG}='feh -dF --auto-rotate'

alias -g L='|less'
alias -g G='|grep'

# thefuck
#eval $(thefuck --alias wut)
