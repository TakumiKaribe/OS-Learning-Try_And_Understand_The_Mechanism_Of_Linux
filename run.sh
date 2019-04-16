docker run --rm --privileged --security-opt="seccomp=unconfined" -it -w /mnt -v $PWD:/mnt $1 bash

