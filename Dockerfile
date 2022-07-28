FROM jenkins/jenkins:2.346.2-jdk11
USER root
RUN apt-get update && apt-get install -y curl &&  apt-get upgrade -y && \
curl -0 https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz --output apache-maven-3.8.6-bin.tar.gz  && \
tar xvfz apache-maven-3.8.6-bin.tar.gz && mv apache-maven-3.8.6 /opt/apache-maven-3.8.6 && rm apache-maven-3.8.6-bin.tar.gz

WORKDIR /opt

RUN ln -sf apache-maven-3.8.6 maven

WORKDIR /usr/bin

RUN ln -sf /opt/maven/bin/mvn

WORKDIR /root

RUN curl -0 https://get.docker.com | sh -
