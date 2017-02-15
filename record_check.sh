#!/bin/bash -p

# Checks for given domain name if target IP address matches the given IP address.
# When the given IP addresses are no longer equal, user will be notified. Script 
# could be useful if you want to determine if a recently modified A record is in 
# effect. 

# Write secure shell scripts
set -euf -o pipefail

# Current record target IP address
IPADDR="0.0.0.0"

# Domain (or subdomain)
DOMAIN="example.example.com"

# Query domain and extract target IP
LOOKUP_RESULT=`nslookup ${DOMAIN} \
  | grep Address \
  | grep -v \# \
  | cut -d' ' -f2`

# Show given input
echo "IPADDR =" ${IPADDR}
echo "DOMAIN =" ${DOMAIN}

# Print time stamp + target IP address for given domain
while [ "${LOOKUP_RESULT}" = "${IPADDR}" ]
do
    echo "[`date +%k:%M:%S`]" ${DOMAIN} "=" ${LOOKUP_RESULT}
    sleep 2
done

# Notify user if record target IP has changed (alert)
notify-send -u critical "[!]`date +%k:%M:%S` - record_check.sh: \"modified record detected\"" "\nTarget IP address for ${DOMAIN} changed.\n\nNew IP address: ${LOOKUP_RESULT} (old address is: ${IPADDR})"

exit 0
