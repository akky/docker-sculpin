FROM debian:jessie
MAINTAINER Akky AKIMOTO <akimoto@gmail.com>

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y git php5-cli php5-curl && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
ADD https://download.sculpin.io/sculpin.phar /usr/local/bin/sculpin
RUN chmod 555 /usr/local/bin/sculpin

VOLUME /data
WORKDIR /data
EXPOSE 8000

ENTRYPOINT ["sculpin"]

