#!/usr/bin/env bash

docker build \
    --pull \
    -f Dockerfile \
    -t brotherhoodofcoders/easysync:alpine3.14 \
    .
