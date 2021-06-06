FROM php:7.4-fpm-alpine

ENV DATA_ROOT /data

WORKDIR ${DATA_ROOT}

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

RUN mkdir -p ${DATA_ROOT}/public/symfony
RUN mkdir -p ${DATA_ROOT}/public/www
RUN mkdir -p ${DATA_ROOT}/public/newpool

COPY deploy/php-fpm/php-fpm.d /usr/local/etc/php-fpm.d
