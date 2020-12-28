FROM debian:buster

MAINTAINER Giuseppe Morelli <info@giuseppemorelli.net>

ENV USER root
ENV HOME /root

RUN apt-get -y update \
    && apt-get -y install \
    apt-transport-https \
    ca-certificates \
    wget \
    zip

RUN wget -O "/usr/local/bin/ngrok.zip" "https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip" \
    && unzip /usr/local/bin/ngrok.zip \
    && chmod 777 /usr/local/bin/ngrok

RUN apt-get clean \
    && rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* \
    /usr/share/man \
    /usr/share/doc \
    /usr/share/doc-base

ADD ngrok.yml $HOME/ngrok.yml
COPY script /opt/script/

EXPOSE 4040
CMD ["/opt/script/entrypoint.sh"]
