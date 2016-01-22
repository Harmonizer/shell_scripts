#!/usr/local/bin/bash
#
# Results are displayed after user has logged in, so not a real motd but it does the trick.
# Using printf formatting to create a table with multiple items.
# Hostname, Date & uptime
# Color is dark blue
#
printf "\n" #newline
printf "\e[0;34mHostname  : %s\nDate      : %s\nUptime    :%s\n \e[0m" \
"$(uname -n)" "$(date -R | awk '{print $1,$2,$3,$4;}')" " $(uptime | awk '{print $3,$4,$1;}' | cut -d , -f 1)"

# Installed kernel version patchlvl, active users & last time current user logged in
# Color is orange
#
printf "\n\e[0;33mVersion   : %s\nUsers     : %s\nLast      :%s\n \e[0m" \
"$(freebsd-version)" "$(who | wc -l | awk '{print $1;}')" " $(lastlogin cyberian | awk '{print $5,$6,$7,$8;}')"
printf "\n" #newline

# List all jails inside ezjail's scope
# Color is purple
#
printf "\e[0;35m"
ezjail-admin list | cut -c 1-38
printf "\e[0m"
printf "\n" #newline
exit 0
