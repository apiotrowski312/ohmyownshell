#!/bin/bash

export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden'
export FZF_DEFAULT_OPTS='--height 40% --no-multi --select-1 --exit-0'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

# -----------------------------------------------------------------------------
# fzf cd replacement
#
# https://github.com/junegunn/fzf/wiki/examples#changing-directory
# -----------------------------------------------------------------------------
function c() {
  local dir
  dir=$(fd --type directory --follow --hidden . $HOME | fzf --layout=reverse --query="$1") && cd "$dir"
}