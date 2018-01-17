FROM jenkins/jenkins:latest
MAINTAINER julian_metro
USER root
RUN apt-get update && apt-get install -y maven
USER jenkins
