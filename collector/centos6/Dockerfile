FROM centos:centos6
MAINTAINER Sang Song <swsong@websqrd.com>

RUN echo 'root:password' | chpasswd

RUN yum clean all
RUN yum install -y curl sudo

##Disable Defaults requiretty in sudoers file
RUN sed -i "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers

# Install EPEL (Extra Packages for Enterprise Linux) for Docker on CentOS
RUN rpm -iUvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# Install SSH Deamon
RUN yum install -y openssh-server
RUN mkdir /var/run/sshd

# Install for Fluentd
RUN yum install -y sudo vim net-tools ntp

# Install Supervisor
RUN yum install -y supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisord.conf
RUN chmod 644 /etc/supervisord.conf

# Install Fluentd
RUN curl -L http://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh | sh
COPY td-agent.server.conf /etc/td-agent/td-agent.conf

# Expose the ports we're interested in
EXPOSE 22 24224 24220

CMD ["/usr/bin/supervisord"]