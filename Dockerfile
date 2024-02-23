FROM varnish:7.4.2

USER root

ENV VCL_CONFIG=/etc/varnish/default.vcl

ENV CACHE_SIZE=64m

ENV VARNISHD_PARAMS=-p default_ttl=3600

ENV SECRET_FILE=/etc/varnish/secret

EXPOSE 80
