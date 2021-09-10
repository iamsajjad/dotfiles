
# ... .bashrc

# source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# bash aliases file
if [ -e $HOME/.config/bash/aliases.sh ]; then
    source $HOME/.config/bash/aliases.sh
fi

# bash exports file
if [ -e $HOME/.config/bash/exports.sh ]; then
    source $HOME/.config/bash/exports.sh
fi

# bash prompt file
if [ -e $HOME/.config/bash/prompt.sh ]; then
    source $HOME/.config/bash/prompt.sh
fi

# bash sources file
if [ -e $HOME/.config/bash/sources.sh ]; then
    source $HOME/.config/bash/sources.sh
fi

