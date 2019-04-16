FROM ubuntu

RUN \
    apt-get -y update \
    && apt-get -y install build-essential less gdb \
    && apt-get install -y strace \
    && apt-get install -y sysstat \
    && apt-get clean

