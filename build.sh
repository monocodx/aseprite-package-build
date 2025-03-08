#!/bin/bash

# handle ctrl+c signal
handle_sigint() {
    echo "catch [ctrl+c] exits signal..."
    exit 1
}
trap handle_sigint SIGINT

# load build config file
source build.cfg

echo "[build] $NAME-$VERSION $TARGET package"

# create package directory if not exists
if [ ! -d "package" ]; then
    mkdir package
fi

# variable
IMAGE_TAG="build.package/aseprite:$TARGET"
CONTAINER="aseprite_$TARGET"

# build package
docker build --build-arg NAME=$NAME --build-arg VERSION=$VERSION --build-arg TARGET=$TARGET --no-cache -f dockerfile/aseprite.$TARGET -t $IMAGE_TAG .

docker run -d -w /home --name $CONTAINER $IMAGE_TAG

docker cp $CONTAINER:/home/aseprite-$VERSION-$TARGET-x64.tar.gz package/.

# clean container build resource
echo "[clean] container resources"

docker rm --force $CONTAINER
docker image rm $IMAGE_TAG
