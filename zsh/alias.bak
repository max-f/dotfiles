#!/usr/bin/env zsh
#
#alias startx='startx > ~/.startx.log 2>&1'
alias ..='cd ..'
alias ...='cd ../..'

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

# dropbox
alias dropup="sh $HOME/devel/bash/dropbox.sh up"
alias dropdown="sh $HOME/devel/bash/dropbox.sh down"

# git (c&p from oh-my-zsh)
# Aliases
alias g='git'
alias gst='git status'
alias gl='git pull'
alias gup='git fetch && git rebase'
alias gp='git push'
gdv() { git-diff -w "$@" | view - }
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gco='git checkout'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias glg='git log --stat --max-count=5'

# Git and svn mix
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'

#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
echo ${ref#refs/heads/}
}

# these aliases take advantage of the previous function
alias ggpull='git pull origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'

# handling certain filetypes
alias -s {mp3,avi,mpeg,mpg,ogg}=mplayer
alias -s {htm,html}=$BROWSER
alias -s {c,cpp,py,java,cfg}=$EDITOR
#alias -s h=$EDITOR
#alias -s hs=$EDITOR
alias -s pdf=evince
alias -s {png,jpg,JPG,JPEG,PNG}='feh -dF'
alias -s pls=audacious

alias -g L='|less'
alias -g G='|grep'
