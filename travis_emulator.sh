#!/bin/bash

set -e
set -x

#docker build -t proxyfs test/container
#cidfile=$(mktemp -u)
#docker run -it -v `pwd`:/gopathroot/src/github.com/swiftstack/ProxyFS --cidfile "${cidfile}" proxyfs bash -c "/gopathroot/src/github.com/swiftstack/ProxyFS/test/container/launch.sh"
docker run -it -v `pwd`:/gopathroot/src/github.com/swiftstack/ProxyFS proxyfs bash -c "/gopathroot/src/github.com/swiftstack/ProxyFS/test/container/launch.sh"
