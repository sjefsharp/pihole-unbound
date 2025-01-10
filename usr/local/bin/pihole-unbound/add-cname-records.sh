#!/bin/bash
set -e

CNAME_FILE="/etc/dnsmasq.d/05-cname.conf"
: > "$CNAME_FILE"

IFS=","
for entry in $CNAME_ENTRIES; do
    alias="${entry%%=*}"
    target="${entry#*=}"

    if ! grep -Fxq "cname=$alias,$target" "$CNAME_FILE"; then
        echo "cname=$alias,$target" >> "$CNAME_FILE"
    fi
done

echo "PIHOLE-UNBOUND [i] CNAME records update complete."