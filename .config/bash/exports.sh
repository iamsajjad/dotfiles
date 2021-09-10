
# ... exports.sh

# user specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# exports
export PATH

# editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# remove duplicate entries from history
export HISTCONTROL=ignoreboth

