# Builds and installs PyBGPStream from source rather than from apt
# packages to allow for newer dependencies to be used.
ARG BS_LIB_VERSION="latest"
FROM alistairking/libbgpstream:${BS_LIB_VERSION}
LABEL maintainer="Alistair King <alistair@kiwimaple.com>"

RUN apt-get update
RUN apt-get install -y curl python3-dev python3-pip

ARG BS_VERSION="2.0.2"
RUN cd /build/ && \
  curl -LO https://github.com/CAIDA/pybgpstream/releases/download/v${BS_VERSION}/pybgpstream-${BS_VERSION}.tar.gz && \
  pip3 install pybgpstream-${BS_VERSION}.tar.gz

# TODO: use a multi-stage build and copy out the stuff we've built