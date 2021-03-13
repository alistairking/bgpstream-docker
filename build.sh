#!/usr/bin/env bash
set -e

REPO="alistairking"

if [[ $# < 2 ]]; then
    echo "Usage: $0 {libbgpstream|pybgpstream} version [latest]"
    exit 1
fi
img="$1"
version="$2"
if [[ "$3" != "" ]]; then
    latest="$REPO/$img:latest"
fi

latest_tag=""
if [[ "$latest" != "" ]]; then
    latest_tag="-t $latest"
fi

cd $img/
docker build \
       --build-arg BS_VERSION=$version \
       -t $REPO/$img:$version \
       $latest_tag \
       .

docker push $REPO/$img:$version
if [[ "$latest" != "" ]]; then
    docker push $latest
fi
