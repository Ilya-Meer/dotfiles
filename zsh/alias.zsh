#!/usr/bin/env bash

# Conf files
alias gitconf="v ~/.gitconfig"
alias zshconf="v ~/.zshrc"
alias vimconf="v ~/.vim/.vimrc"

# Reload zsh config
alias reload="source ~/.zshrc"

# Use brew installed universal ctags
alias ctags="/usr/local/bin/ctags"

# Shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dm="cd ~/Documents"

#########
# General
#########

# Open Time Log in VS Code
alias t="code ~/Documents/Notes/Time.md"

alias android="open -a 'Android Studio'"
alias ios="open -a xcode ."

alias hs="history"
alias v="vim"

# Show path segments
alias path="tr ':' '\n' <<< '$PATH'"

# Weather
alias weather="curl wttr.in"

# Moon phase
alias moon="curl wttr.in/Moon"

# Git add with fzf multi-select
alias fa="git ls-files -m -o --exclude-standard | fzf --print0 -m | xargs -0 -t -o git add"

# General purpose fzf to xargs
alias fx="fzf -m | xargs -t" 

# Zettelkasten date
alias zd="date +%Y%m%d%H%M%S"