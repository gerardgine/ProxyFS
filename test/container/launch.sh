#!/bin/bash

set -e
set -x

# Install tools needed above what's in a minimal base box
yum -y install wget git

# Install Golang

yum -y --disableexcludes=all install gcc
cd /tmp
wget -q https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz
tar -C /usr/local -xf go1.8.3.linux-amd64.tar.gz
rm -rf go1.8.3.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

# Install Python pip
yum -y install epel-release
yum -y install python-pip
pip install --upgrade pip

# Setup ProxyFS build environment
pip install requests
yum -y install json-c-devel
yum -y install fuse
export GOPATH=/gopathroot
export PATH=$PATH:$GOPATH/bin
echo "user_allow_other" >> /etc/fuse.conf

# Setup Samba
yum -y install gcc-c++-4.8.5-16.el7_4.1 \
               python-devel-2.7.5-58.el7 \
               gnutls-devel-3.3.26-9.el7 \
               libacl-devel-2.2.51-12.el7 \
               openldap-devel-2.4.44-5.el7 \
               samba-4.6.2-12.el7_4 \
               samba-client-4.6.2-12.el7_4 \
               cifs-utils-6.2-10.el7
cd $GOPATH/src/github.com/swiftstack/ProxyFS/vfs
git clone -b samba-4.6.12 --single-branch --depth 1 https://github.com/samba-team/samba.git samba4-6-12-centos
ln -s samba4-6-12-centos samba
cd samba
./configure
make clean
make GEN_NDR_TABLES
export SAMBA_SOURCE=$GOPATH/src/github.com/swiftstack/ProxyFS/vfs/samba

# Install Python tox
pip install tox

# Build ProxyFS and run tests
cd $GOPATH/src/github.com/swiftstack/ProxyFS
