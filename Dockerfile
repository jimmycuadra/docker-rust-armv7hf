FROM resin/armv7hf-debian-qemu

RUN ["cross-build-start"]

ENV USER root
ENV RUST_VERSION=1.18.0

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    git \
    libssl-dev \
    pkg-config && \
  curl -sO https://static.rust-lang.org/dist/rust-$RUST_VERSION-armv7-unknown-linux-gnueabihf.tar.gz && \
  tar -xzf rust-$RUST_VERSION-armv7-unknown-linux-gnueabihf.tar.gz && \
  ./rust-$RUST_VERSION-armv7-unknown-linux-gnueabihf/install.sh --without=rust-docs && \
  DEBIAN_FRONTEND=noninteractive apt-get remove --purge -y curl && \
  DEBIAN_FRONTEND=noninteractive apt-get autoremove -y && \
  rm -rf \
    rust-$RUST_VERSION-armv7-unknown-linux-gnueabihf \
    rust-$RUST_VERSION-armv7-unknown-linux-gnueabihf.tar.gz \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* && \
  mkdir /source
VOLUME ["/source"]
WORKDIR /source
CMD ["/bin/bash"]

RUN ["cross-build-end"]
