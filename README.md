# Synopsis
This repo enables boot2docker to run and build arm binaries using qemu and binfmt_misc. That means arm emulation.

# Usage
Build docker image

    git clone https://github.com/atyenoria/boot2docker-qemu-arm-emulation.git
    cd boot2docker-qemu-arm-emulation
    docker build -t atyenoria/boot2docker-qemu-arm-emulation .

Activate binfmt_misc in this container

    docker run -it --privileged atyenoria/boot2docker-qemu-arm-emulation bash
    uname -a
    "Linux f1da933fe007 4.0.9-boot2docker #1 SMP Thu Aug 13 03:05:44 UTC 2015 x86_64 GNU/Linux"
    update-binfmts --display
    update-binfmts --enable
    sudo mount -t binfmt_misc binfmt_misc /proc/sys/fs/binfmt_misc
    sh -c 'echo -1 > /proc/sys/fs/binfmt_misc/arm'
    sh -c 'echo ":arm:M::\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x28\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/bin/qemu-arm-static:" > /proc/sys/fs/binfmt_misc/register'

    #enabled check
    update-binfmts --display

Run arm container on local machine

    docker run -it resin/armv7hf-debian bash
    uname -a
    "Linux b48485ce730c 4.0.9-boot2docker #1 SMP Thu Aug 13 03:05:44 UTC 2015 armv7l GNU/Linux"

Comp

# Tested target machine
    mac os x 10.10.5

# References
https://github.com/dweinstein/dockerfile-qemu-arm-chroot