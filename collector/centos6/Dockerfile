FROM centos:centos6
MAINTAINER Sang Song <swsong@websqrd.com>

RUN echo 'root:password' | chpasswd

RUN yum clean all; yum update
RUN yum install -y curl

# Install SSH Deamon
RUN yum install -y openssh-server
RUN mkdir /var/run/sshd

# Install for Fluentd
RUN yum install -y sudo vim net-tools ntp

# Install Supervisor
RUN yum install -y supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/
RUN chmod 644 /etc/supervisor/conf.d/supervisord.conf

#NTPD
sudo chkconfig ntpd on
sudo service ntpd stop
sudo ntpdate time.nist.gov
sudo service ntpd start

# Install Fluentd
RUN curl -L http://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh | sh
COPY td-agent.server.conf /etc/td-agent/td-agent.conf

# Expose the ports we're interested in
EXPOSE 22 24224 24220

CMD ["/usr/bin/supervisord"]