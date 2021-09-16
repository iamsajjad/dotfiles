
# ... .zshrc

# set ZDOTDIR to zsh config directory
export ZDOTDIR=$HOME/.config/zsh

# source zsh config files
for file in $ZDOTDIR/*.zsh; do source $file; done

