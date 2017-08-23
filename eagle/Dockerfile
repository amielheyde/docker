FROM jokke/ubuntu-mate-x2go-desktop

MAINTAINER Joachim Wickman <joachim@wickman.in>

# set correct environment variables
ENV EAGLE_VER=7.7.0
ENV USER=eagle
ENV HOME=/home/eagle
ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm

RUN \
    apt-get update && \
    apt-get install -y aptitude bzip2 libcups2 man-db nano git && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m $USER && \
    mkdir -p $HOME/Documents && \
    wget -q -O /tmp/eagle-lin64-${EAGLE_VER}.run http://web.cadsoft.de/ftp/eagle/program/$(echo $EAGLE_VER | cut -d '.' -f1-2)/eagle-lin64-${EAGLE_VER}.run && \
    chmod +x /tmp/eagle-lin64-${EAGLE_VER}.run && \
    /tmp/eagle-lin64-${EAGLE_VER}.run /opt && \
    ln -sf eagle-${EAGLE_VER} /opt/eagle && \
    chown -R $USER:$USER $HOME && \
    chown -R $USER:$USER /opt/eagle-${EAGLE_VER}

RUN wget -q -O /tmp/sparkfun-libs-master.zip https://github.com/sparkfun/SparkFun-Eagle-Libraries/archive/master.zip && \
    unzip -d /opt/sparkfun /tmp/sparkfun-libs-master.zip

VOLUME $HOME/Documents
WORKDIR $HOME

COPY ["eagle.desktop", "/usr/share/applications/"]
