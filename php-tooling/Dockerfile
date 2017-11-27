FROM php:7.1-alpine
RUN apk add --no-cache build-base autoconf --virtual .build-deps \
    && pecl install redis \
    && pecl install xdebug \
    && docker-php-ext-enable redis xdebug \
    && apk del .build-deps
