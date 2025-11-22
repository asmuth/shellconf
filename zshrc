export NEWLINE=$'\n'
export PROMPT="%F{8}%M %~${NEWLINE}%F{0}> "

precmd() {
  if [[ $PROMPT_INIT -eq 1 ]]; then
    print ""
  else
    PROMPT_INIT=1
  fi
}

export HISTFILE=~/.history
export HISTSIZE=5000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY

export EDITOR=vim
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

alias ..='cd ..'
alias c="clear; unset PROMPT_INIT"
alias l='ls --color=auto'
alias ll='ls --color=auto -lah'
alias o='file-open'
alias t="title-set"
alias x="fgrep-pwd"
alias xl="find . | grep -I"
alias gpp="git pull && git push"
alias gst="git status"
alias sshu=" ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias scpu="scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias dum="du -cksh  * | sort -h -r"
alias duma="du -hs .[^.]* | sort -h -r"

sedx() {
  find . -name "$1" -exec sed -i'' -e "s/$2/$3/g" {} \;
}

fgrep-pwd() {
  fgrep -n --color=auto -R "$*" .
}

file-open() {
  if [[ -d "$1" ]]; then
    dolphin "$1" &
  else
    xdg-open "$1"
  fi
}

file-select() {
  local selected="$(fzf)"
  READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}$selected${READLINE_LINE:$READLINE_POINT}"
  READLINE_POINT=$(( READLINE_POINT + ${#selected} ))
}

bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^t" file-select
