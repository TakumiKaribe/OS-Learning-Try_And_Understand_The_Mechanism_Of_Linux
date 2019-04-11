FROM ubuntu
RUN apt-get update \
    && apt-get install -y strace \
    && apt-get install -y sysstat
WORKDIR /work
COPY . .
ENTRYPOINT ["sh", "cmd.sh"]
