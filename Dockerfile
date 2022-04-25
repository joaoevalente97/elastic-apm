FROM docker.io/bitnami/minideb:buster
WORKDIR /apm

RUN apt update && apt upgrade
RUN apt install curl -y
RUN curl -L -O https://artifacts.elastic.co/downloads/apm-server/apm-server-8.1.3-amd64.deb
RUN dpkg -i apm-server-8.1.3-amd64.deb
COPY apm-server.yml /etc/apm-server/apm-server.yml
CMD apm-server -e

EXPOSE 8200
