FROM centos:7
ENV NG_VERSION 4.3.2
ADD https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.3.2.tar.gz /usr/local/src
RUN yum install -y epel-release; \
    yum makecache fast; \
    yum groupinstall -y "Development Tools"; \
    yum install -y gd-devel; \
    cd /usr/local/nagios-$NG_VERSION; \
