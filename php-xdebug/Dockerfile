FROM php:7.1-fpm-alpine
EXPOSE 9000
RUN apk add --no-cache build-base autoconf git --virtual .build-deps \
    && pecl install redis \
    && pecl install xdebug \
    && docker-php-ext-enable redis xdebug \
    && apk del .build-deps \
