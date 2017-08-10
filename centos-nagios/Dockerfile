FROM centos:7
ADD https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.3.2.tar.gz /usr/local/src
RUN yum install -y epel-release; \
    yum makecache fast; \
    yum groupinstall -y "Development Tools";