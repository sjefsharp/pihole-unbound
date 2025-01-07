FROM pihole/pihole:latest

RUN apt-get update && \
    apt-get install -y unbound wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY etc/unbound/unbound.conf.d/pi-hole.conf /etc/unbound/unbound.conf.d/pi-hole.conf
COPY etc/dnsmasq.d/99-edns.conf /etc/dnsmasq.d/99-edns.conf

RUN mkdir -p /var/log/unbound
RUN touch /var/log/unbound/unbound.log
RUN chown unbound /var/log/unbound/unbound.log

RUN curl -o /var/lib/unbound/root.hints https://www.internic.net/domain/named.cache

RUN mkdir -p /etc/services.d/unbound
COPY unbound-run /etc/services.d/unbound/run
RUN chmod +x /etc/services.d/unbound/run

ENTRYPOINT ["/s6-init"]