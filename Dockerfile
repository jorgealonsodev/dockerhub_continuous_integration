# Extraido de https://hub.docker.com/_/php
FROM php:7.2-apache

# COPY index.php/ /var/www/html/  -- Es mejor colocarlo de ultimo por si se producen cambios en el futuro
# COPY php.ini /usr/local/etc/php/

RUN pecl install xdebug-2.6.0 \
    && docker-php-ext-enable xdebug \
    && docker-php-ext-install pdo pdo_mysql

# Este cambia menos
COPY php.ini /usr/local/etc/php/

# Este archivo va a ser el que tenga mas cambios, mejor ponerlo al final.
COPY index.php/ /var/www/html/