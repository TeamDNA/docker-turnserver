FROM phusion/baseimage:0.9.18
MAINTAINER Brian Prodoehl <bprodoehl@connectify.me>

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install -y coturn

RUN groupadd turnserver
RUN useradd -g turnserver turnserver

RUN mkdir /etc/service/turnserver
ADD turnserver.sh /etc/service/turnserver/run

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
