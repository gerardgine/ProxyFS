FROM centos:7.4.1708

# Install tools needed above what's in a minimal base box
RUN yum -y install wget git

# Install Golang

RUN yum -y --disableexcludes=all install gcc
#RUN cd /tmp
#RUN wget -q https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz
#RUN tar -C /usr/local -xf go1.8.3.linux-amd64.tar.gz
#RUN rm go1.8.3.linux-amd64.tar.gz
#RUN echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bash_profile

# Install Python pip
RUN yum -y install epel-release
RUN yum -y install python-pip
RUN pip install --upgrade pip

# Setup ProxyFS build environment
RUN pip install requests
RUN yum -y install json-c-devel
RUN yum -y install fuse

# Setup Samba

RUN yum -y install gcc-c++-4.8.5-16.el7_4.1 \
               python-devel-2.7.5-58.el7 \
               gnutls-devel-3.3.26-9.el7 \
               libacl-devel-2.2.51-12.el7 \
               openldap-devel-2.4.44-5.el7 \
               samba-4.6.2-12.el7_4 \
               samba-client-4.6.2-12.el7_4 \
               cifs-utils-6.2-10.el7

RUN echo $GOPATH
RUN which go
RUN ls -la /usr/local && ls -la /usr/local/go && ls -la /usr/local/go/bin