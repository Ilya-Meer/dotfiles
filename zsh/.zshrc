# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""' 

# Tmux
export TERM="screen-256color-bce"

# Set path to .vimrc
export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/.vim/.vimrc'
 
# Source Dotfiles

source $HOME/alias.zsh
source $HOME/functions.zsh

# RBEnv
export PATH="$HOME/.rbenv/bin:/usr/local/bin:$PATH"
eval "$(rbenv init -)"

# User installed gems
export PATH="$PATH:$HOME/.gem/ruby/2.6.0/bin"

# Go Path
export GOPATH=$(go env GOPATH)
export PATH="$PATH:$(go env GOPATH):$(go env GOPATH)/bin"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Java
export ANDROID_HOME="/Users/ilyameerovich/Library/Android/sdk"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home"

# Disable completion in insecure directories
ZSH_DISABLE_COMPFIX="true"

##################################
########### ZSH Config ###########
##################################

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="risto"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z rails ruby rake zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

ZVM_CURSOR_STYLE_ENABLED=false
