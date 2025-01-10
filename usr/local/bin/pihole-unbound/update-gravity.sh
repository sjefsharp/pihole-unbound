#!/bin/bash
set -e

echo "PIHOLE-UNBOUND [i] Updating Pi-hole gravity lists..."
pihole -g

if [ $? -eq 0 ]; then
    echo "PIHOLE-UNBOUND [i] Gravity update complete."
else
    echo "PIHOLE-UNBOUND [i] Failed to update gravity." >&2
    exit 1
fi