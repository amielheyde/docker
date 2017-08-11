FROM jokke/ubuntu-mate-x2go-desktop

MAINTAINER Joachim Wickman <joachim@wickman.in>

# set correct environment variables
ENV USER=fritzing
ENV HOME=/home/fritzing
ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm

RUN \
    apt-get update && \
    apt-get install -y aptitude bzip2 qtdeclarative5-dev nano && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m $USER && \
    mkdir -p $HOME/Documents && \
    wget -q http://fritzing.org/download/0.9.3b/linux-64bit/fritzing-0.9.3b.linux.AMD64.tar.bz2 -O /tmp/fritzing.tar.bz2 && \
    tar -xjf /tmp/fritzing.tar.bz2 -C /opt && \
    wget -q https://github.com/adafruit/Fritzing-Library/raw/master/AdaFruit.fzbz -O $HOME/AdaFruit.fzbz && \
    rm /tmp/fritzing.tar.bz2 && \
    ln -s /opt/fritzing-0.9.3b.linux.AMD64 /opt/fritzing && \
    chown -R $USER:$USER $HOME

VOLUME $HOME/Documents
WORKDIR $HOME/Documents

COPY ["fritzing.desktop", "/usr/share/applications/"]
