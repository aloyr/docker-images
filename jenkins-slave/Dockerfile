FROM jenkinsci/slave
USER root
RUN apt-get update; \
    apt-get install bash -y; \
    apt-get clean;
USER jenkins
