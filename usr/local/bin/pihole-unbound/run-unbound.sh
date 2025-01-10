#!/bin/bash
set -e

UNBOUND_EXEC=/usr/sbin/unbound

echo "PIHOLE-UNBOUND [i] Starting Unbound service..."
exec $UNBOUND_EXEC -d