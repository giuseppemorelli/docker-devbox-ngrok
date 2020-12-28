FROM debian:buster

MAINTAINER Giuseppe Morelli <info@giuseppemorelli.net>

RUN apt-get -y update \
    && apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    zip

RUN curl -Lo /bin/ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip \
    && cd /bin/ && unzip ngrok.zip && rm ngrok.zip \
    && chmod 777 /bin/ngrok

RUN apt-get clean \
    && rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* \
    /usr/share/man \
    /usr/share/doc \
    /usr/share/doc-base

EXPOSE 4040
CMD ["/bin/sh"]
