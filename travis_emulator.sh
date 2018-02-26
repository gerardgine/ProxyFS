#!/bin/bash
# Adding stupid comments...
set -e
set -x

rm -rf vfs/samba*
docker build -t proxyfs test/container
docker run -it -v `pwd`:/gopathroot/src/github.com/swiftstack/ProxyFS proxyfs bash -c "/gopathroot/src/github.com/swiftstack/ProxyFS/test/container/launch.sh"

