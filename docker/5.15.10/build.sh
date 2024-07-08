#!/bin/bash

CONTAINER_REGISTRY="kakalin"
CONTAINER_REPOSITORY="qt"
CONTAINER_TAG="5.15.10"
PLATFORM="linux/amd64"
ARCH=""

# if [[ "$OSTYPE" == "linux-gnu"* ]]; then
#     PLATFORM="linux/amd64"
#     ARCH="amd64"
# elif [[ "$OSTYPE" == "darwin"* ]]; then
#     if [[ $(uname -m) == "arm64" ]]; then
#         PLATFORM="linux/arm64"
#         ARCH="arm64"
#     elif [[ $(uname -m) == "x86_64" ]]; then
#         PLATFORM="linux/amd64"
#         ARCH="amd64"
#     fi
# else
#     echo "Haven't supported this OS Type, please check command\n and update it."
# fi

echo "Platform: $PLATFORM"
docker build --rm \
    --platform $PLATFORM \
    -t $CONTAINER_REGISTRY/$CONTAINER_REPOSITORY:$CONTAINER_TAG .
