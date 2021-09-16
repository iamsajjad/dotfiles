
# ... bindings.zsh

# search commands history
bindkey "^p" up-line-or-beginning-search
bindkey "^n" down-line-or-beginning-search
bindkey "^k" up-line-or-beginning-search
bindkey "^j" down-line-or-beginning-search

# edit command line in vim
bindkey '^e' edit-command-line

# disable ctrl-s from freeze terminal
stty stop undef

