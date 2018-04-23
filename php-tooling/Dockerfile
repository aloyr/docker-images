FROM php:7.1-alpine
ENV PATH="/vendor/bin:${PATH}"
RUN apk add --no-cache build-base autoconf --virtual .build-deps \
    && apk add --no-cache git \
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
    && composer require drupal/coder \
    && mkdir /tools/drupal/vendor/drupal/coder/coder_sniffer/DrupalAll \
    && /tools/drupal/vendor/bin/phpcs --config-set installed_paths /tools/drupal/vendor/drupal/coder/coder_sniffer \
    && mkdir -p /tools/drupalconsole \
    && cd /tools/drupalconsole \
    && composer require drupal/console \
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
    && composer require pantheon-systems/terminus 1.8.0 \
    && mkdir -p /tools/terminus/plugins \
    && composer create project -n -d /tools/terminus/plugins pantheon-systems/terminus-build-tools-plugin:~1 \
    && ls /tools/ | while read tool; do \
         ls /tools/$tool/vendor/bin/ | while read binary; do \
           rm -f /usr/local/bin/$binary; \
           ln -s /tools/$tool/vendor/bin/$binary /usr/local/bin; \
         done; \
      done \
    && touch /root/.bash_profile \
    && curl -sS https://platform.sh/cli/installer | php \
    && cp /root/.platformsh/bin/platform /usr/local/bin \
    && apk del .build-deps
COPY DrupalAll/ruleset.xml /tools/drupal/vendor/drupal/coder/coder_sniffer/DrupalAll/ruleset.xml
COPY ./scripts/build-tools-ci.sh /scripts/
RUN logfile="/version.txt" \
    && > $logfile \
    && php --version | sed -ne 's/^\(PHP [^ ]\+\) .*/\1/gp' >> $logfile \
    && pecl list | tail -n +4 >> $logfile \
    && composer --version >> $logfile \
    && /tools/drupal/vendor/bin/drush --version >> $logfile \
    && /tools/drupal/vendor/bin/phpcs --version >> $logfile \
    && /tools/drupal/vendor/bin/phpcs -i >> $logfile \
    && composer -d/tools/drupalconsole show | grep drupal | head -n 1 >> $logfile \
    && /tools/php/vendor/bin/phpmd --version >> $logfile \
    && /tools/php/vendor/bin/phing -v >> $logfile \
    && /tools/php/vendor/bin/phpunit --version >> $logfile \
    && /tools/php/vendor/bin/phpcpd --version >> $logfile \
    && /tools/phpdocumentor/vendor/bin/phpdoc --version >> $logfile \
    && /tools/codeception/vendor/bin/codecept --version >> $logfile \
    && terminus --version >> $logfile \
    && platform --version >> $logfile \
    && chmod +x /scripts/build-tools-ci.sh
