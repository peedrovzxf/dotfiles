#!/usr/bin/env zsh
# Uncomment for debuf with `zprof`
# zmodload zsh/zprof

# ZSH Ops
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FCNTL_LOCK
setopt +o nomatch
# setopt autopushd

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Start Zim
source "$ZIM_HOME/init.zsh"

# Async mode for autocompletion
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_HIGHLIGHT_MAXLENGTH=300

source "$DOTFILES_PATH/shell/init.sh"

fpath=(
    "$DOTFILES_PATH/shell/zsh/themes"
    "$DOTFILES_PATH/shell/zsh/completions"
    "$DOTLY_PATH/shell/zsh/themes"
    "$DOTLY_PATH/shell/zsh/completions"
    $fpath
)

autoload -Uz promptinit && promptinit
prompt ${DOTLY_THEME:-codely}

source "$DOTLY_PATH/shell/zsh/bindings/dot.zsh"
source "$DOTLY_PATH/shell/zsh/bindings/reverse_search.zsh"
source "$DOTFILES_PATH/shell/zsh/key-bindings.zsh"

# pnpm
export PNPM_HOME="/home/peedrovzxf/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#

nv() {
  local file="${1:-.}"
  tmux kill-window -t main:neovim 2>/dev/null
  tmux new-window -t main: -n "neovim" "nvim $(realpath "$file")"
  tmux move-window -t main:neovim -t main:0
  tmux select-window -t main:neovim
}

if [ -n "$HYPRLAND_INSTANCE_SIGNATURE" ] && [ -z "$TMUX" ]; then
  SESSION="main"
  if tmux has-session -t "$SESSION" 2>/dev/null; then
    tmux attach-session -t "$SESSION"
  else
    tmux new-session -d -s "$SESSION" -n "neovim" "nvim"
    tmux new-window -t "$SESSION:" -n "term"
    tmux attach-session -t "$SESSION"
  fi
fi
