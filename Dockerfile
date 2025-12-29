FROM yiisoftware/yii2-php:8.4-apache-min

WORKDIR /app

# Dependencias del sistema
RUN apt-get update && apt-get install -y --no-install-recommends \
    git unzip curl \
    libpng-dev libjpeg-dev libfreetype6-dev \
    libmariadb-dev libmariadb-dev-compat \
    libpq-dev libmagickwand-dev libmemcached-dev libssl-dev \
    libzip-dev pkg-config \
    locales cron \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo_mysql pdo_pgsql gd zip intl pcntl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*


# Habilitar OPcache con configuración por defecto
RUN docker-php-ext-enable opcache
 

# Instalar Imagick
RUN pecl install imagick \
    && docker-php-ext-enable imagick

# Instalar Memcached
RUN pecl install memcached \
    && docker-php-ext-enable memcached   

# Copiar archivos de composer primero para usar cache
COPY --chown=www-data:www-data composer.json composer.lock ./

# Instalar Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

