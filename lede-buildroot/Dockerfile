FROM ubuntu:xenial

MAINTAINER Joachim Wickman <joachim@wickman.in>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y -qq && \
    apt-get install -y git-core subversion mercurial nano sudo wget \
        build-essential libssl-dev libncurses5-dev unzip gawk zlib1g-dev && \

# clean up
    apt-get remove -y openssh-client manpages manpages-dev krb5-locales locales && \
    apt-get -y autoremove && \
    apt-get clean && \

# add user
    useradd -m lede && \
    echo 'lede ALL=NOPASSWD: ALL' > /etc/sudoers.d/lede

USER lede

# clone LEDE repo
RUN cd ~ && git clone --depth=1 https://git.lede-project.org/source.git && \
    cd source && \
    git fetch --tags && \
    git checkout v17.01.3 && \
    ./scripts/feeds update -a && \
    ./scripts/feeds install -a

CMD ["/bin/bash"]
