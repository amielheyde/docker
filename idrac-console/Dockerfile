FROM jokke/ubuntu-mate-x2go-desktop

MAINTAINER Joachim Wickman <joachim@wickman.in>

USER root

# install OpenJDK Java 7 and some helper utilities
RUN apt-add-repository ppa:openjdk-r/ppa -y && \
    apt-get update -qq && \
    apt-get install -y icedtea-8-plugin wget nano xdg-utils && \

# clean up
    apt-get clean && apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

# create desktop user
RUN useradd -m desktop
RUN chown -R desktop:desktop /home/desktop

# allow ancient iDRAC console
RUN sed -i '/jdk.jar.disabledAlgorithms/c\jdk.jar.disabledAlgorithms=MD2, RSA keySize < 1024' /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/java.security
