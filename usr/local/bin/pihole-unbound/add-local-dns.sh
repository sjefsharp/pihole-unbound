#!/bin/bash
set -e

LOCALDNS_FILE="/etc/pihole/custom.list"
: > "$LOCALDNS_FILE"

IFS=","
for entry in $LOCALDNS; do
    ip="${entry%%=*}"
    domain="${entry#*=}"

    if ! grep -Fxq "$ip $domain" "$LOCALDNS_FILE"; then
        echo "$ip $domain" >> "$LOCALDNS_FILE"
    fi
done

echo "PIHOLE-UNBOUND [i] Local DNS entries update complete."