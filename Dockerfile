FROM php:8.1.0-fpm
RUN usermod -u 1000 www-data
ADD ./src /var/www/html
WORKDIR /var/www/html
RUN apt-get update && apt-get install -y libpq-dev zlib1g-dev \
      autoconf \
      build-essential \
      apt-utils \
      libzip-dev \
      unzip \
      zip \
      libmagick++-dev \
      libmagickwand-dev \
      libpq-dev \
      libfreetype6-dev \
      libjpeg62-turbo-dev \
      libpng-dev \
      libwebp-dev \
      libxpm-dev

RUN docker-php-ext-install pdo pdo_pgsql pdo_mysql exif pcntl bcmath gd zip

RUN docker-php-ext-configure gd \
    --with-jpeg=/usr/include/ \
    --with-freetype=/usr/include/



