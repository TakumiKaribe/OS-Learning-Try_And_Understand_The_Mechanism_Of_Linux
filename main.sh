#!/usr/bin/env bash

printf "\e[33;1m[STEP1: docker build]\n\e[m"
docker build -t takumikaribe/mechanism_linux

printf "\n\e[33;1m[STEP2: docker run]\n\e[m"
docker run  --rm -it -w /mnt -v $PWD:/mnt takumikaribe/mechanism_linux bash

printf "\n\e[33;1m[STEP3: docker rmi]\n\e[m"
docker rmi takumikaribe/mechanism_linux:latest
