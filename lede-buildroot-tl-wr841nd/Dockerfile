FROM jokke/lede-buildroot

MAINTAINER Joachim Wickman <joachim@wickman.in>

ENV DEBIAN_FRONTEND noninteractive

COPY ["config", "/home/lede/source/.config"]

RUN cd ~/source && \
    sudo chown lede .config && \
    make defconfig && \

# Compile firmware
    make -j "$(getconf _NPROCESSORS_ONLN 2> /dev/null)" V=s 2>&1 | tee build.log | grep -i error

CMD ["/bin/bash"]
