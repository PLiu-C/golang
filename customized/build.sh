# !/bin/bash

#
# First need to extract golang source archive from my golang repo by
#    git archive -o go-1.14.2.tar.xz
# which will be used in Dockerfile
#

GO_VER=1.14.2
ALPINE_VER=3.11

set -x
docker build --force-rm \
    -f Dockerfile \
    --build-arg GO_VER=${GO_VER} \
    --build-arg ALPINE_VER=${ALPINE_VER} \
    --build-arg HTTP_PROXY=https://10.211.55.2:1081 \
    --build-arg HTTPS_PROXY=https://10.211.55.2:1081 \
    -t golang:${GO_VER}-alpine${ALPINE_VER} \
    .

set +x
