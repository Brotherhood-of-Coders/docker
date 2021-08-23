#!/usr/bin/env bash

docker build \
    --pull \
    -f Dockerfile \
    -t brotherhoodofcoders/php:8.0.8-cli-alpine3.14-imagick \
    .
