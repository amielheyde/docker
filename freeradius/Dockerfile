FROM ubuntu:xenial
MAINTAINER Joachim Wickman <joachim@wickman.in>

ENV DEBIAN_FRONTEND noninteractive

EXPOSE 1812/udp 1813/udp

RUN apt-get -y update && \
    apt-get -y dist-upgrade && \
    apt-get install -y locales freeradius freeradius-utils freeradius-mysql net-tools

# generate locales
RUN locale-gen en_US.UTF-8

# set locale
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD /usr/sbin/freeradius -X
