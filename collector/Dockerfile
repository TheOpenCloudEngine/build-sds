FROM ubuntu:12.04
MAINTAINER Sang Song <swsong@websqrd.com>

RUN echo 'root:password' | chpasswd

RUN apt-get update
RUN apt-get install -y curl

# Install SSH Deamon
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

# Install for Fluentd
RUN apt-get install -y sudo vim net-tools

# Install Supervisor
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/
RUN chmod 644 /etc/supervisor/conf.d/supervisord.conf

# Install Fluentd
RUN curl -L http://toolbelt.treasuredata.com/sh/install-ubuntu-precise-td-agent2.sh | sh
COPY td-agent.server.conf /etc/td-agent/td-agent.conf

# Expose the ports we're interested in
EXPOSE 22 24224 24220
