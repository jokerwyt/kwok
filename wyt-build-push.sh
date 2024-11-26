#!/bin/bash

set -ex

KWOK_ROOT_DIR=~/kubefuture/kwok

# check if we have login docker
docker login

pushd $KWOK_ROOT_DIR

# rm all images with prefix localhost/kwok, might be not exist
docker images | grep "localhost/kwok" | awk '{print $3}' | xargs docker rmi -f || true

# rm all images with prefix docker.io/jokerwyt/kwok, in crictl
crictl images | grep "docker.io/jokerwyt/kwok" | awk '{print $3}' | xargs crictl rmi || true

IMAGE_PREFIX=localhost BUILDER=docker make build build-image

# grep "localhost/kwok" in the output of docker images, and get the imageTag
# localhost/kwok                       v0.6.0-126-gf972843-dirty                        399657af022f   About a minute ago   98.9MB

imageTag=$(docker images | grep "localhost/kwok" | awk '{print $2}')

echo "We built kwok image with tag: ${imageTag}"
echo "retag it as docker.io/jokerwyt/kwok:latest"

# retag it as docker.io/jokerwyt/kwok:latest
docker tag localhost/kwok:${imageTag} docker.io/jokerwyt/kwok:latest

# push
docker push docker.io/jokerwyt/kwok:latest

# crictl pull that image
crictl pull docker.io/jokerwyt/kwok:latest

docker system prune -f

popd