
# ... completions.zsh

autoload -Uz compinit
zmodload zsh/complist

# initialize completion
compinit

# include hidden files and directories
_comp_options+=(globdots)

