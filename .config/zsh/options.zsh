
# ... options.zsh

# let zsh sessions append their history list to the history file
setopt appendhistory

# perform the cd command to that directory
setopt autocd

# treat the `#', `~' and `^' characters as part of patterns for filename generation
setopt extendedglob

# if a pattern for filename generation has no matches, print an error,
# instead of leaving it unchanged in the argument list.
setopt nomatch

# on an ambiguous completion, instead of listing possibilities or beeping,
# insert the first match immediately
setopt menucomplete

# allow comments even in interactive shells.
setopt interactive_comments

# disable beeping
unsetopt BEEP

