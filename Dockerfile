FROM ubuntu

RUN \
    apt-get -y update \
    && apt-get -y install build-essential less gdb \
    && apt-get -y install strace \
    && apt-get -y install sysstat \
    && apt-get clean

