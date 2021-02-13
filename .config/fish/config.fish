# vi keybindings ftw!
fish_vi_key_bindings

# Aliases
alias S='sudo'
alias v='nvim'

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

# better ask before we lose data
alias rm='rm -Iv'
alias cp='cp -riv'
alias mv='mv -iv'
alias mkdir='mkdir -vp'

alias bat='bat --theme="Sublime Snazzy"'

# VPN
alias protonvpn='S protonvpn'

# Starship prompt!
starship init fish | source
