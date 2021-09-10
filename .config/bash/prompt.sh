
# ... prompt.sh

# Show current git branch in prompt.
GITBranch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="\[\e[1m\e[35m\]\u\[\e[90m\]@\h ...\W\[\e[36m\]\$(GITBranch)>\[\e[35m\]>\[\e[39m\]>\[\e[22m\] "

