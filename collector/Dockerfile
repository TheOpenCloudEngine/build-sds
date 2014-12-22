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

# Install Fluentd
RUN curl -L http://toolbelt.treasuredata.com/sh/install-ubuntu-precise-td-agent2.sh | sh
COPY td-agent.server.conf /etc/td-agent/td-agent.conf
RUN /etc/init.d/td-agent restart
RUN mkdir /var/log/td-agent/
RUN chown td-agent:td-agent /var/log/td-agent/

# Expose the ports we're interested in
EXPOSE 22 8080 9990 24224 24220

CMD ["/usr/bin/supervisord"]