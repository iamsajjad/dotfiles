
# ... uptime.sh

# return uptime (UP NUMBER UNIT)
uptime | cut -f 4-5 -d ' ' | cut -f 1 -d ',' | awk '{print "UP "$0}'

