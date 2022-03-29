#!/usr/bin/env bash

docker build \
    --pull \
    -f Dockerfile \
    -t brotherhoodofcoders/nginx:1.20.2-alpine-geoip2 \
    .
