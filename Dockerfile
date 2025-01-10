FROM pihole/pihole:latest

RUN apt-get update && \
    apt-get install -y --no-install-recommends unbound curl && \
    rm -rf /var/lib/apt/lists/*

COPY etc/unbound/unbound.conf.d/pi-hole.conf /etc/unbound/unbound.conf.d/pi-hole.conf
COPY etc/dnsmasq.d/99-edns.conf /etc/dnsmasq.d/99-edns.conf
COPY etc/s6-overlay/s6-rc.d/ /etc/s6-overlay/s6-rc.d/
COPY usr/local/bin/pihole-unbound/ /usr/local/bin/pihole-unbound/

RUN chmod +x /usr/local/bin/pihole-unbound/*.sh

ENTRYPOINT ["/s6-init"]

HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD dig +short @127.0.0.1 -p 5335 google.com > /dev/null || exit 1