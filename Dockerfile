FROM php:fpm-alpine3.11
RUN apk update && apk add openssl zip unzip git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo
WORKDIR /var/www/html
COPY . /var/www/html
RUN composer install
CMD php-fpm
