#!/bin/bash
set -e

UNBOUND_ANCHOR_EXEC=/usr/sbin/unbound-anchor
UNBOUND_EXEC=/usr/sbin/unbound
UNBOUND_ROOT_KEY=/var/lib/unbound/root.key

echo "PIHOLE-UNBOUND [i] Updating DNSSEC root keys..."
if ! $UNBOUND_ANCHOR_EXEC -a "$UNBOUND_ROOT_KEY"; then
    echo "PIHOLE-UNBOUND [i] Failed to update DNSSEC root keys." >&2
    exit 1
fi