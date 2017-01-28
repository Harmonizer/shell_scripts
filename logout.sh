#!/bin/bash -p

# Enables a immediate logout of any session you're currently signed into.
# Script sends out SIGKILL signals, so be sure to have sufficient permissions.

# Write secure shell scripts
set -euf -o pipefail

readonly MAINSESSION=`pgrep session` 
readonly SESSIONLIST=`ps -ef | grep session | awk '{print $2}'`

# Confirm requested log-out action
echo -en "\nLog out of current session? [y/n] "
read inputok
if [[ "${inputok}" = "y" ]] || [[ "${inputok}" = "yes" ]]; then

   # Send SIGKILL to session manager process
   sudo kill -9 $MAINSESSION
   
   # Wait 2 seconds before killing related PIDs
   sleep 2

   # If process CMD matches 'session' send SIGKILL
   for process in $SESSIONLIST; do
      sudo kill -9 $process
   done
fi 
exit 0
