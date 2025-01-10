#!/bin/bash
set -e

echo "PIHOLE-UNBOUND [i] Restarting Pi-hole DNS service..."
pihole restartdns

if [ $? -eq 0 ]; then
    echo "PIHOLE-UNBOUND [i] DNS service restarted successfully."
else
    echo "PIHOLE-UNBOUND [i] Failed to restart DNS service." >&2
    exit 1
fi