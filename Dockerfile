FROM ubuntu

RUN apt-get -y update
RUN \
    apt-get -y install \
    build-essential less gdb \
    strace \
    sysstat \
    && apt-get clean

