#!/bin/bash
set -e

ROOT_HINTS_FILE="/var/lib/unbound/root.hints"
ROOT_HINTS_URL="https://www.internic.net/domain/named.cache"

echo "PIHOLE-UNBOUND [i] Updating root hints file..."
curl -o "$ROOT_HINTS_FILE" "$ROOT_HINTS_URL"

if [ $? -eq 0 ]; then
    echo "PIHOLE-UNBOUND [i] Root hints file updated successfully."
else
    echo "PIHOLE-UNBOUND [i] Failed to update root hints file." >&2
    exit 1
fi