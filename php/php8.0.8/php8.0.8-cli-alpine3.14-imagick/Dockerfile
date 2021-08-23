FROM php:8.0.8-cli-alpine3.14

RUN set -xe \
    && apk update \
    && apk add --no-cache \
        imagemagick \
        imagemagick-dev \
        libgomp \
        ${PHPIZE_DEPS}

RUN pecl install -o -f imagick \
    && docker-php-ext-enable \
        imagick \
    && apk del ${PHPIZE_DEPS}
