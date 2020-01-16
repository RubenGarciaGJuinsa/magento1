FROM php:5.5-apache AS web

RUN apt-get update \
    && apt-get -y install \
    php5-mhash \
    php5-mcrypt \
    php5-curl \
    php5-cli \
    php5-mysql \
    php5-gd

RUN apt-get update \
    && apt-get -y install \
    libpng-dev \
    libxml2-dev

RUN docker-php-ext-install gd

RUN docker-php-ext-install soap

RUN docker-php-ext-install pdo_mysql

FROM mariadb:10.4.11 AS db
COPY migration/ /docker-entrypoint-initdb.d/