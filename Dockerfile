FROM ubuntu:xenial
MAINTAINER Alexander Paul <alex.paul@wustl.edu>

LABEL \
  version="1.0.0" \
  description="Docker image to run AnnotSV"

RUN apt-get update -y && apt-get install -y \
  g++ \
  libbz2-dev \
  liblzma-dev \
  make \
  python \
  tar \
  tcl \
  wget \
  zlib1g-dev

ENV BEDTOOLS_INSTALL_DIR=/opt/bedtools2
ENV BEDTOOLS_VERSION=2.28.0

WORKDIR /tmp
RUN wget https://github.com/arq5x/bedtools2/releases/download/v$BEDTOOLS_VERSION/bedtools-$BEDTOOLS_VERSION.tar.gz && \
  tar -zxf bedtools-$BEDTOOLS_VERSION.tar.gz

WORKDIR /tmp/bedtools2
RUN make && \
  mkdir --parents $BEDTOOLS_INSTALL_DIR && \
  mv ./* $BEDTOOLS_INSTALL_DIR

WORKDIR /
RUN ln -s $BEDTOOLS_INSTALL_DIR/bin/* /usr/bin/ && \
  rm -rf /tmp/bedtools2
