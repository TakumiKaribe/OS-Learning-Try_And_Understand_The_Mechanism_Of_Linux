#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    printf "\e[31;1m[ERROR] input to exec path.\n\e[m"
    exit 1
fi

TARGET_DIR=./$1

cp -f ./Dockerfile ${TARGET_DIR}

printf "\e[33;1m[STEP1: docker build]\n\e[m"
docker build -t takumikaribe/mechanism_linux:latest ${TARGET_DIR}/

printf "\n\e[33;1m[STEP2: docker run]\n\e[m"
docker run --rm --privileged --security-opt="seccomp=unconfined" takumikaribe/mechanism_linux:latest

printf "\n\e[33;1m[STEP3: docker rmi]\n\e[m"
docker rmi takumikaribe/mechanism_linux:latest

rm ${TARGET_DIR}/Dockerfile
printf "\n\e[33;1mcompleted\n\e[m"
