# Use the official Pi-hole image as the base
FROM pihole/pihole:latest

# Install Unbound
RUN apt-get update && \
    apt-get install -y unbound && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy Unbound configuration file
COPY etc/unbound/unbound.conf.d/pi-hole.conf /etc/unbound/unbound.conf.d/pi-hole.conf
COPY etc/dnsmasq.d/99-edns.conf /etc/dnsmasq.d/99-edns.conf

# Add a service to start unbound.
RUN mkdir -p /etc/services.d/unbound
COPY unbound-run /etc/services.d/unbound/run
RUN chmod +x /etc/services.d/unbound/run

# Start Pi-hole and Unbound
ENTRYPOINT ["/s6-init"]