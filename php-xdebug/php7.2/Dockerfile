FROM alpine:3.8
EXPOSE 9000
RUN apk add --no-cache \
        php7 \
        php7-fpm \
        php7-opcache \
        php7-curl \
        php7-bcmath \
        php7-bz2 \
        php7-calendar \
        php7-ctype \
        php7-dba \
        php7-dom \
        php7-exif \
        php7-fileinfo \
        php7-ftp \
        php7-gd \
        php7-gettext \
        php7-gmp \
        php7-iconv \
        php7-imagick \
        php7-intl \
        php7-json \
        php7-ldap \
        php7-mbstring \
        php7-mcrypt \
        php7-memcached \
        php7-mysqli \
        php7-mysqlnd \
        php7-openssl \
        php7-pcntl \
        php7-pdo \
        php7-pdo_mysql \
        php7-pdo_pgsql \
        php7-pdo_sqlite \
        php7-pear \
        php7-phar \
        php7-posix \
        php7-redis \
        php7-session \
        php7-shmop \
        php7-simplexml \
        php7-soap \
        php7-sockets \
        php7-sqlite3 \
        php7-ssh2 \
        php7-sysvmsg \
        php7-sysvsem \
        php7-sysvshm \
        php7-tokenizer \
        php7-wddx \
        php7-xdebug \
        php7-xml \
        php7-xmlreader \
        php7-xmlwriter \
        php7-xsl \
        php7-zip \
        php7-zlib \
    && sed -i.bak 's/memory_limit = 128M/memory_limit = 1024M/g' /etc/php7/php.ini \
    && sed -i.bak 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/g' /etc/php7/php-fpm.d/www.conf \
    && sed -i.bak 's/variables_order = "G/variables_order = "EG/g' /etc/php7/php.ini \
    && sed -i.bak 's/;zend/zend/g' /etc/php7/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=1" >> /etc/php7/conf.d/xdebug.ini \
    && echo "xdebug.remote_host=172.16.123.45" >> /etc/php7/conf.d/xdebug.ini \
    && echo "xdebug.remote_port=9000" >> /etc/php7/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=1" >> /etc/php7/conf.d/xdebug.ini \
    && echo "xdebug.max_nesting_level=500" >> /etc/php7/conf.d/xdebug.ini \
    && echo "" >> /etc/php7/php-fpm.conf \
    && echo "daemonize = no" >> /etc/php7/php-fpm.d/custom.conf \
    && echo 'clear_env = no' >> /etc/php7/php-fpm.d/www.conf

CMD ["php-fpm7"]
