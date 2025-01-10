#!/bin/bash
set -e

ADLISTS_FILE="/etc/pihole/adlists.list"
: > "$ADLISTS_FILE"

IFS=","
for entry in $ADLISTS; do
    url="${entry%%=*}"
    comment="${entry#*=}"
    
    if ! grep -Fxq "$url" "$ADLISTS_FILE"; then
        echo "$url" >> "$ADLISTS_FILE"
        [[ -n "$comment" && "$url" != "$comment" ]] && echo "# $comment" >> "$ADLISTS_FILE"
    fi
done

echo "PIHOLE-UNBOUND [i] Ad-lists update complete."