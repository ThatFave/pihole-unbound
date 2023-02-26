FROM pihole/pihole:latest
RUN apt update && apt install -y unbound

COPY ./src/lighttpd-external.conf /etc/lighttpd/external.conf 
COPY ./src/unbound-pihole.conf /etc/unbound/unbound.conf.d/pihole.conf
COPY ./src/99-edns.conf /etc/dnsmasq.d/99-edns.conf
COPY ./src/01-pihole.conf /etc/dnsmasq.d/01-pihole.conf
COPY ./src/unbound-run /etc/services.d/unbound/run


ENTRYPOINT ["/s6-init"]
