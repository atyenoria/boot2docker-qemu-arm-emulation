FROM debian:jessie
MAINTAINER atyenoria

RUN apt-get -qq -y update
RUN apt-get -qq -y install qemu-user qemu-user-static
RUN apt-get clean
