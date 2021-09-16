
# ... vimode.zsh

bindkey -v

# get menuselect
zstyle ':completion:*' menu select

# use vim keys in tab completion menu:
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        # block
        vicmd) echo -ne '\e[1 q';;
        # beam
        viins|main) echo -ne '\e[5 q';;
    esac
}
zle -N zle-keymap-select

function zle-line-init() {
    # initiate `vi insert` as key binding
    # (can be removed if `bindkey -V` has been set elsewhere)
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# use beam shape cursor on startup
echo -ne '\e[5 q'

# use beam shape cursor for each new prompt
preexec() { echo -ne '\e[5 q' ;}

