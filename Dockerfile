FROM pihole/pihole:latest
RUN apt update && apt install -y unbound

COPY ./config/lighttpd-external.conf /etc/lighttpd/external.conf 
RUN ["/bin/mkdir","-p","/etc/unbound/unbound.conf.d/"]
COPY ./config/unbound-pihole.conf /etc/unbound/unbound.conf.d/unbound-pihole.conf
COPY ./config/99-edns.conf /etc/dnsmasq.d/99-edns.conf
COPY ./config/01-pihole.conf /etc/dnsmasq.d/01-pihole.conf
COPY unbound-run /etc/services.d/unbound/run

ENTRYPOINT ["/s6-init"]
