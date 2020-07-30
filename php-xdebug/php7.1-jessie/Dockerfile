FROM php:7.1-fpm-jessie
EXPOSE 9000
RUN apt-get update && apt-get install imagemagick libmagickwand-dev -y \
    && pecl install redis \
    && pecl install xdebug imagick \
    && docker-php-ext-enable redis xdebug \
    && docker-php-ext-install pdo_mysql \
    && echo "memory_limit = 1024M" >> /usr/local/etc/php/conf.d/custom.ini \
