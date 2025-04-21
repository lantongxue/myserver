# syntax=docker.io/docker/dockerfile:1.7-labs
FROM php:zts-alpine
LABEL authors="kali"
LABEL version="1.0.0"
LABEL description="my server"

RUN curl -sSLf \
        -o /usr/local/bin/install-php-extensions \
        https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions && \
    chmod +x /usr/local/bin/install-php-extensions

RUN apk add --no-cache linux-headers freetype-dev jpeg-dev sqlite-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd pcntl pdo pdo_mysql pdo_sqlite bcmath bz2 sockets \
    && IPE_PROCESSOR_COUNT=$(nproc) install-php-extensions imagick redis event swoole @composer

COPY --exclude=.env --exclude=./runtime --exclude=./vendor . /www
WORKDIR /www

RUN composer install

EXPOSE 8787

ENTRYPOINT ["./entrypoint.sh"]