export PS1="\[\e[90m\]\h \w\n\[\e[39m\]> "
export PS2=" > "
export PROMPT_COMMAND='title-display; dirhist-add; history -a; prompt-separator'
export EDITOR=vim
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

HISTIGNORE='ls:ll:l:c'
HISTFILESIZE=10000
HISTSIZE=1000000
HISTTIMEFORMAT='%F %T '
shopt -s histappend

alias ..='cd ..'
alias c="clear; unset PROMPT_INIT"
alias j="dirhist-jump"
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

title-set() {
  TITLE="$1"
}

title-display() {
  echo -en "\033]0;"
  if [[ -n "$TITLE" ]]; then 
    echo "${TITLE}"
  else
    pwd
  fi
  echo -en "\a"
}

prompt-separator() {
  if [[ $PROMPT_INIT -eq 1 ]]; then
    echo
  else
    PROMPT_INIT=1
  fi
}

dirhist-add() {
  pwd >> ~/.dirhist
}

dirhist-jump() {
  dir="$(
    cat ~/.dirhist | \
      sort | uniq -c | sort -rn | sed -e 's/^ *//' | cut -f2 -d' ' | \
      grep $1 | head -n1
  )"

  if [[ -d "$dir" ]]; then
    echo "$dir"
    cd "$dir"
  else
    return 1
  fi
}

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

bind -x '"\C-t": file-select'
