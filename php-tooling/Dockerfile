FROM php:7.1-alpine
RUN pecl install redis \
    && pecl install xdebug \
    && docker-php-ext-enable redis xdebug
