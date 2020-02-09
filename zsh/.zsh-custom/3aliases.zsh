#!/usr/bin/env zsh

# check if $1 exists
function command_exists() {
    type -p "$1" &> /dev/null
}


#alias startx='startx > ~/.startx.log 2>&1'
alias ..='cd ..'
alias ...='cd ../..'

if command_exists exa; then
    alias e='exa -F'
    alias ee='exa -lgF --git'
    alias els='exa'
    alias ell='exa -l --git --group-directories-first'
    alias elsd='exa -ld *(-/N)'
    #alias lsf='exa -l *(-.N)'
    alias elsl='exa -l *(@)'
    alias elal='exa -al --group-directories-first'
    alias elsnew='exa -l -s modified --git *(D.om[1,10])'
    alias etree='exa --tree --color-scale -L 5'
fi

#alias ls='ls -lh --group-directories-first --color=auto'
alias ls='ls -sh --group-directories-first --color=auto'
# list visible directories
alias lsd='ls -d *(-/N)'
# list visible files
alias lsf='ls *(-.N)'
# list symlinks
alias lsl='ls -l *(@)'
# list the ten newest files
alias lsnew='ls -rtlh *(D.om[1,10])' 

# better ask before we lose data
alias rm='rm -Iv'
alias cp='cp -iv'
alias mv='mv -iv'

alias bat='bat --theme="base16"'
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
alias v='vim'

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
eval $(thefuck --alias wut)
