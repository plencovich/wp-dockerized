FROM wordpress:php8.2-fpm

ARG HTTP_PROXY
ARG HTTPS_PROXY
ARG NO_PROXY

ENV HTTP_PROXY=$HTTP_PROXY
ENV HTTPS_PROXY=$HTTPS_PROXY
ENV NO_PROXY=$NO_PROXY

RUN apt-get update && apt-get install -y \
    unzip less mariadb-client curl libzip-dev libpng-dev libjpeg-dev libfreetype6-dev \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip pdo_mysql

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY entrypoint.sh /entrypoint.sh
COPY plugins /tmp/plugins

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
