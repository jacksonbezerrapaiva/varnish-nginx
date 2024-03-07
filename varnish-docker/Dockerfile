FROM debian:stable-slim

RUN apt-get update 
RUN apt-get install -y varnish
RUN apt install -y supervisor

COPY default.vcl /etc/varnish/default.vcl

COPY start.sh /start.sh
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENV VCL_CONFIG=/etc/varnish/default.vcl
ENV CACHE_SIZE=64m
ENV VARNISHD_PARAMS="-p default_ttl=3600 -p default_grace=3600"

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

EXPOSE 8080
