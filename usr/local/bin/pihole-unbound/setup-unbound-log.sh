#!/bin/bash
set -e

UNBOUND_LOG_DIR="/var/log/unbound"
UNBOUND_LOG_FILE="$UNBOUND_LOG_DIR/unbound.log"

echo "PIHOLE-UNBOUND [i] Setting up Unbound log directory and file..."
mkdir -p "$UNBOUND_LOG_DIR"
touch "$UNBOUND_LOG_FILE"
chown unbound:unbound "$UNBOUND_LOG_FILE"

if [ -f "$UNBOUND_LOG_FILE" ]; then
    echo "PIHOLE-UNBOUND [i] Unbound log setup complete."
else
    echo "PIHOLE-UNBOUND [i] Failed to set up Unbound log." >&2
    exit 1
fi
