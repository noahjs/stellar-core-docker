FROM ubuntu:14.04

RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get -y update
RUN apt-get -y install git build-essential pkg-config autoconf automake libtool bison flex libpq-dev clang++-3.5 gcc-4.9 g++-4.9 cpp-4.9


WORKDIR /root
RUN git clone https://github.com/stellar/stellar-core.git

WORKDIR /root/stellar-core

RUN git submodule init
RUN git submodule update
RUN ./autogen.sh
RUN CXX=clang-3.5 ./configure
RUN make
RUN make install
