FROM centos:7.4.1708

# Install tools needed above what's in a minimal base box
RUN yum -y install wget git

# Install Golang

RUN yum -y --disableexcludes=all install gcc
RUN cd /tmp
RUN wget -q https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz
RUN tar -C /usr/local -xf go1.8.3.linux-amd64.tar.gz
RUN rm go1.8.3.linux-amd64.tar.gz
RUN echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bash_profile

# Install Python pip
RUN yum -y install epel-release python-pip
RUN pip install --upgrade pip

# Setup ProxyFS build environment
RUN pip install requests
RUN yum -y install json-c-devel