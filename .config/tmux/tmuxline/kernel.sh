
# ... kernel.sh

# return kernel version (VERSION.PATCHLEVEL.SUBLEVEL)
uname -r | awk -F'[.-]' '{printf("%d.%d.%d\n", $1, $2, $3)}'

