FROM python:3.10-bullseye

USER root

RUN apt-get update 
RUN apt-get install -y make automake autotools-dev libedit-dev libjemalloc-dev libncurses-dev libpcre2-dev libtool pkg-config python3-sphinx cpio

COPY varnish-cache ./app
COPY varnish-cache/default.vcl ./app

WORKDIR /app
RUN ./autogen.sh
RUN ./configure --with-persistent-storage
RUN make
RUN make install
RUN mkdir varnish-cache

SHELL ["/bin/bash", "-c"]

CMD varnishd -F -f /app/default.vcl \
  -s deprecated_persistent,/app/varnish-cache/LOG,1G \
  -a :80


