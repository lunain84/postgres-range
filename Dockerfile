FROM php:7-cli

RUN apt-get update -yqq \
    && apt-get install git zlib1g-dev libpq-dev libzip-dev -y \
    && docker-php-ext-install pdo pdo_pgsql zip

RUN curl -fsSL https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && composer global require phpunit/phpunit ^8.0 --no-progress --no-scripts --no-interaction

RUN pecl install xdebug \
    &&  docker-php-ext-enable xdebug