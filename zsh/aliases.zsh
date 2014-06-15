#!/usr/bin/env zsh
#
#alias startx='startx > ~/.startx.log 2>&1'
alias ..='cd ..'
alias ...='cd ../..'

alias ls='ls -lh --group-directories-first --color=auto'
alias lsd='ls -d *(-/N)'      # list visible directories
alias lsf='ls *(-.N)'         # list visible files

alias df='df -H'
alias zshrc='. ~/.zshrc && echo "reload ~/.zshrc								${txtblu}[${txtwht}DONE${txtblu}]"'
alias dmtail='dmesg | tail -n 15'
alias netcfg-menu='sudo netcfg-menu'
alias netcfg='sudo netcfg'
alias sumc='su -c mc'
alias startssh='/usr/local/bin/startssh'
alias mtr='mtr --curses'
alias grep='grep --colour=auto'
alias osp='/opt/quake3/ioquake3.x86_64 +set fs_game osp'
alias cpma='/opt/quake3/ioquake3.x86_64 +sef fs_game cpma'
#alias osp='/usr/local/games/quake3/quake3 +set fs_game osp'
#alias cpma='/usr/local/games/quake3/quake3 +set fs_game cpma'
#alias bp='sshfs keks@brechpunkt.de:/home/keks -o nonempty ~/brechpunkt/'
alias qldelay-on='S tc qdisc add dev eth0 root netem delay 15ms'
alias qldelay-off='S tc qdisc del dev eth0 root'

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
alias -s {mp3,avi,mpeg,mpg,ogg}=mplayer
alias -s pls='mplayer -playlist'
alias -s {htm,html}=$BROWSER
alias -s {c,cpp,py,java,cfg}=$EDITOR
#alias -s h=$EDITOR
#alias -s hs=$EDITOR
alias -s {djvu,pdf}=evince
alias -s {png,jpg,JPG,JPEG,PNG}='feh -dF'

alias -g L='|less'
alias -g G='|grep'
