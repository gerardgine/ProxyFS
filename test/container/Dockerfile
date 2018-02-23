FROM centos:7.4.1708

RUN yum -y install wget git epel-release python-pip json-c-devel && \
    yum -y --disableexcludes=all install gcc

RUN cd /tmp && \
    wget -q https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz && \
    tar -C /usr/local -xf go1.8.3.linux-amd64.tar.gz && \
    rm go1.8.3.linux-amd64.tar.gz && \
    echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bash_profile

RUN pip install --upgrade pip && \
    pip install requests
