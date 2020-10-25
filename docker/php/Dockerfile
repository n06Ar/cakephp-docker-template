FROM php:7.4-apache

ENV APACHE_DOCUMENT_ROOT /var/www/html/app/webroot
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
&& sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf \
&& a2enmod rewrite

RUN apt-get update && apt-get install -y \
    libicu-dev \
    libonig-dev \
    zip \
    unzip \
    libpq-dev \
    lipzip-dev \
&& docker-php-ext-install -j$(nproc) intl \
&& docker-php-ext-install -j$(nproc) pcntl \
&& docker-php-ext-install -j$(nproc) zip \
&& docker-php-ext-install -j$(nproc) pdo_mysql \
&& pecl install xdebug \
&& docker-php-ext-enable xdebug

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

COPY . /var/www/html

# composerのインストール
ENV COMPOSER_ALLOW_SUPERUSER 1
COPY --from=composer:1.7 /usr/bin/composer /usr/bin/composer
