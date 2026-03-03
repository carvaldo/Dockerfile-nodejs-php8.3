# Imagem base com PHP 8.3, Apache, Composer, Ghostscript e outras ferramentas.

FROM php:8.4
# FROM php:8.4-apache

# Instala extensões comuns
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    libicu-dev \
    libmagickwand-dev \
    zip \
    unzip \
    curl \
    nano \
    btop \
    iputils-ping \
    pdftk-java \
    poppler-utils \
    ghostscript \
    gsfonts \
    wget \
    ocrmypdf \
    chromium \
    chromium-driver \
    && docker-php-ext-install \
        # mysql
        pdo \
        pdo_mysql \
        # postgres
        pgsql \
        pdo_pgsql \
        mbstring \
        exif \
        pcntl \
        bcmath \
        gd \
        zip \
        intl \
        calendar

# Define locale como UTF-8
RUN apt-get install -y locales \
    && sed -i '/pt_BR.UTF-8/s/^# //g' /etc/locale.gen \
    && locale-gen pt_BR.UTF-8

ENV LANG=pt_BR.UTF-8
ENV LANGUAGE=pt_BR:pt
ENV LC_ALL=pt_BR.UTF-8

# Instala a extensão Imagick via PECL
RUN pecl install imagick && docker-php-ext-enable imagick

RUN apt clean && rm -rf /var/lib/apt/lists/*

# Ativa o mod_rewrite do Apache
# RUN a2enmod rewrite

# Instala o Composer 2
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# ENV COMPOSER_BIN_DIR=/usr/local/bin

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
RUN nvm install --lts

# RUN composer global require laravel/installer

# Copia o arquivo de configuração do PHP
RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

RUN nvm install --lts

EXPOSE 8000

# Define diretório de trabalho
WORKDIR /var/www/html
