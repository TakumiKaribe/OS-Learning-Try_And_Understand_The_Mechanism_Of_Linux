IMAGE_NAME=$(<./image_name)

if [ -z "$(docker image ls -q $IMAGE_NAME)" ]; then
    sh ./build.sh
fi

docker run --rm --privileged --security-opt="seccomp=unconfined" -it -w /mnt -v $PWD:/mnt $IMAGE_NAME bash
