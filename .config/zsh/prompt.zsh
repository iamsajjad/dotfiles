
# ... aliases.zsh

# autoload vcs and colors
autoload -Uz vcs_info
autoload -U colors && colors

# enable only git
zstyle ':vcs_info:*' enable git

# setup a hook that runs before every ptompt.
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# add a function to check for untracked files in the directory.
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

# add `!` sign to the PROMPT if there is untracked files in the repository
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='!'
    fi
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats "%{$fg[white]%}:%{$fg[cyan]%}%m%u%c%{$fg[white]%}%{$fg[white]%} %b%{$fg[white]%}:"

# format our main prompt for hostname current folder, and permissions.
PROMPT="%B%{$fg[white]%}%{$fg[magenta]%}%n%{$fg[cyan]%}@%{$fg[gray]%}%m%{$fg[white]%}:%(?:%{$fg_bold[white]%}:)%{$fg[cyan]%}%c%{$reset_color%}"

# PROMPT="%{$fg[white]%}%n@%m %~ %{$reset_color%}%#> "
PROMPT+="\$vcs_info_msg_0_ "

