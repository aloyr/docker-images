FROM php:7.1-alpine
ENV PATH="/vendor/bin:${PATH}"
RUN apk add --no-cache build-base autoconf git --virtual .build-deps \
    && pecl install redis \
    && pecl install xdebug \
    && docker-php-ext-enable redis xdebug \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer \
    && mkdir -p /tools/drupal \
    && cd /tools/drupal \
    && composer require drush/drush \
    && composer require drupal/drupal \
    && composer require drupal/coder \
    && /tools/drupal/vendor/bin/phpcs --config-set installed_paths /vendor/drupal/coder/coder_sniffer \
    && mkdir -p /tools/php \
    && cd /tools/php \
    && composer require phpmd/phpmd \
    && composer require phing/phing \
    && composer require phpunit/phpunit \
    && composer require phpunit/php-code-coverage \
    && composer require sebastian/phpcpd \
    && mkdir -p /tools/phpdocumentor \
    && cd /tools/phpdocumentor \
    && composer require phpdocumentor/phpdocumentor \
    && mkdir -p /tools/codeception \
    && cd /tools/codeception \
    && composer require codeception/codeception \
    && mkdir -p /tools/terminus \
    && cd /tools/terminus \
    && composer require pantheon-systems/terminus \
    && apk del .build-deps
