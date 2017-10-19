FROM ubuntu:xenial

MAINTAINER Joachim Wickman <joachim@wickman.in>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y -qq && \
    apt-get install -y git-core subversion mercurial nano sudo wget \
        build-essential libssl-dev libncurses5-dev unzip gawk zlib1g-dev

# clean up
RUN apt-get remove -y openssh-client manpages manpages-dev krb5-locales locales && \
    apt-get -y autoremove && \
    apt-get clean
# add user
RUN useradd -m lede && \
    echo 'lede ALL=NOPASSWD: ALL' > /etc/sudoers.d/lede && \
    chown lede:lede -R /home/lede

USER lede
WORKDIR /home/lede
COPY ["entrypoint.sh", "/"]
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]
