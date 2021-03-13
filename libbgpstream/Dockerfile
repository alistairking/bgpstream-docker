# Builds and installs BGPStream from source rather than from apt
# packages to allow for newer dependencies to be used.
FROM debian:buster-slim
LABEL maintainer="Alistair King <alistair@kiwimaple.com>"

RUN apt-get update
RUN apt-get install -y curl lsb-release sudo
RUN curl https://pkg.caida.org/os/debian/bootstrap.sh | bash
RUN apt-get install -y build-essential libwandio1-dev

ARG RDK_VERSION="1.6.1"
RUN mkdir /build/
RUN cd /build/ && \
  curl -LO https://github.com/edenhill/librdkafka/archive/v${RDK_VERSION}.tar.gz && \
  tar zxf v${RDK_VERSION}.tar.gz && \
  cd librdkafka-${RDK_VERSION} && \
  ./configure && \
  make && \
  make install && \
  ldconfig

ARG BS_VERSION="2.1.0"
RUN cd /build/ && \
  curl -LO https://github.com/CAIDA/libbgpstream/releases/download/v${BS_VERSION}/libbgpstream-${BS_VERSION}.tar.gz && \
  tar zxf libbgpstream-${BS_VERSION}.tar.gz && \
  cd libbgpstream-${BS_VERSION}/ && \
  ./configure ${BS_CONF_ARGS} && \
  make && \
  make install && \
  ldconfig

# TODO: use a multi-stage build and copy out the stuff we've built