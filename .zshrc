# Created by maciej for 5.8
# Aliases
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# History and Cache
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Tab and Autocompletion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
source ~/.config/git-completion.zsh
compinit
_comp_options+=(globdots) # include hidden files

# Vi mode
bindkey -v

# zsh syntax hilighting
source /home/maciej/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# startship command prompt
eval "$(starship init zsh)"

# clear errors
clear
