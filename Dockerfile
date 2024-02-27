FROM php:8.2-cli
LABEL maintainer="Akky AKIMOTO <akimoto@gmail.com>"

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get autoremove -y \
    && apt-get install -y \
        software-properties-common \
        git\
        libzip-dev \
        zip \
        tzdata \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip \
    && apt-get update -y
# for debug
#RUN apt-get install -y vim

COPY --from=composer:2.7.1 /usr/bin/composer /usr/bin/composer

VOLUME /data
WORKDIR /data

EXPOSE 8000
