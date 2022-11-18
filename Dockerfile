FROM ubuntu:xenial

LABEL \
  version="3.1.3" \
  description="Docker image to run AnnotSV"

RUN apt-get update -y && apt-get install -y \
  curl \
  g++ \
  libbz2-dev \
  liblzma-dev \
  make \
  python \
  tar \
  tcl \
  tcllib \
  unzip \
  wget \
  zlib1g-dev \
  git \
  bedtools \
  bcftools 

ENV BEDTOOLS_INSTALL_DIR=/opt/bedtools2
ENV BEDTOOLS_VERSION=2.28.0


ENV ANNOTSV_VERSION=3.1.3
ENV ANNOTSV_COMMIT=2330578d8df0d79a3907c1faf153344e141cd26a
ENV ANNOTSV=/opt/AnnotSV

WORKDIR /opt
RUN git clone https://github.com/lgmgeo/AnnotSV && \
cd AnnotSV  && \
make install && \
export ANNOTSV=/opt/AnnotSV

WORKDIR /opt/AnnotSV
