ARG GO_VERSION=1.22.2

FROM golang:${GO_VERSION}

ARG ENET_VERSION=1.3.17

# Install enet.
# Installs to: /usr/local/lib/libenet.so
RUN apt update && \
    apt install -y autoconf libtool && \
    cd /gotops/enet && \
    autoreconf -vfi && \
    ./configure && make && make install

# Ensure we can find enet at runtime.
ENV LD_LIBRARY_PATH=/usr/local/lib

RUN mkdir -p /gotops
WORKDIR /gotops
COPY . .
