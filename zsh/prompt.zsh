# allow prompt substitutions
setopt prompt_subst

# load colors 
autoload -U colors && colors

# load vcs_info
autoload -Uz vcs_info

zstyle ':vcs_info:*' use-prompt-escapes true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "!"
zstyle ':vcs_info:*' unstagedstr "?"
zstyle ':vcs_info:*' formats " on %s:%b%u%c"
zstyle ':vcs_info:*' actionformats " on %s:%b%u%c %a"

# update vcs_info
function precmd() {
  # nice prompt pls
  vcs_info
  BASEPROMPT="%{$fg_bold[blue]%}%n%{$reset_color%} at %{$fg[cyan]%}%m%{$reset_color%} in %{$fg_bold[green]%}%~%{$fg[red]%}${vcs_info_msg_0_}%{$reset_color%}"
  if [ "${VIRTUAL_ENV}" != "" ]
  then
    BASEPROMPT="${BASEPROMPT} workon $(basename ${VIRTUAL_ENV})"
  fi
  PROMPT="
${BASEPROMPT}
$ "
  RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"
  # set the cwd as terminal title
  print -Pn "\e]2;%n@%M | %~\a"
}
