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
compinit
_comp_options+=(globdots) # include hidden files

# Git completion
zstyle ':completion:*:*:git:*' script ~/.config/zsh/git-completion.bash
fpath=(~/.config/zsh $fpath)
autoload -Uz compinit && compinit

# Vi mode
bindkey -v

# zsh syntax hilighting
source /home/maciej/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# startship command prompt
eval "$(starship init zsh)"

# Aliases
alias discord='cd ~/Apps/discord/Discord && ./Discord'
alias minecraft='cd ~/Apps/minecraft-launcher && ./minecraft-launcher'
alias drun='rofi -modi drun -show drun'

clear
