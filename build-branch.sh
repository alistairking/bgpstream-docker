#!/usr/bin/env bash
set -e

REPO="alistairking"

if [[ $# < 2 ]]; then
    echo "Usage: $0 {libbgpstream|pybgpstream} branch"
    exit 1
fi
img="$1"
branch="$2"
shift 2

cd $img/
docker build \
       -f Dockerfile.branch \
       --build-arg GITHUB_ORG=$REPO \
       --build-arg BS_BRANCH=$branch \
       -t $REPO/$img:$branch \
       "$@" \
       .

docker push $REPO/$img:$branch
