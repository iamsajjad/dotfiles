
# ... sets.fish

# removes paths
set -e fish_user_paths
# add paths
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths

# Supresses fish's intro message
set fish_greeting

# editor
set EDITOR nvim
set VISUAL "$EDITOR"

# set manpager
# uncomment only one of these!

# "bat" as manpager
# set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# "vim" as manpager
# set -x MANPAGER '/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

# "nvim" as manpager
set -x MANPAGER "nvim -c 'set ft=man' -"

