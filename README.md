# pihole-unbound

Pi-hole as All-Around DNS Solution in a Docker container.

Example .env:

PIHOLE_WEBPORT=8080
TZ=Europe/Amsterdam
WEBPASSWORD=your_password
PIHOLE_DNS_=127.0.0.1#5335
FTLCONF_LOCAL_IPV4=192.168.2.2
ADLISTS="https://example.com/adlist1.txt=First=adlist,https://example.com/adlist2.txt=Second adlist"
LOCALDNS="192.168.1.1=router.local,192.168.1.100=myserver.local"
CNAME_ENTRIES="example.com=example.local,example2.com=example2.local"
DNSMASQ_LISTENING="all"
