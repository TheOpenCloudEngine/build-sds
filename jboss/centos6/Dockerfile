FROM centos:centos6
MAINTAINER Sang Song <swsong@websqrd.com>

RUN echo 'root:password' | chpasswd

RUN yum clean all
RUN yum install -y curl sudo java-1.7.0-openjdk.x86_64 tar

##Disable Defaults requiretty in sudoers file
RUN sed -i "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers

# Install EPEL (Extra Packages for Enterprise Linux) for Docker on CentOS
RUN rpm -iUvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# Install SSH Deamon
RUN yum install -y openssh-server openssh-clients
RUN mkdir /var/run/sshd
# Enable ssh connect
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

# Install for Fluentd
RUN yum install -y sudo vim net-tools ntp

# Install JBoss
ENV WILDFLY_VERSION 8.1.0.Final
ENV JAVA_OPTS "-Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0"
RUN groupadd -r wildfly -g 433 && useradd -u 431 -r -g wildfly -d /opt/wildfly -s /sbin/nologin -c "WildFly user" wildfly
RUN mkdir /opt/wildfly-$WILDFLY_VERSION
RUN cd /opt && curl http://download.jboss.org/wildfly/8.1.0.Final/wildfly-8.1.0.Final.tar.gz | tar zx && chown -R wildfly:wildfly /opt/wildfly-8.1.0.Final
RUN ln -s /opt/wildfly-$WILDFLY_VERSION /opt/wildfly && chown -R wildfly:wildfly /opt/wildfly
ENV JBOSS_HOME /opt/wildfly

# Install Apache webserver
RUN yum install -y httpd

# Install Supervisor
RUN yum install -y supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisord.conf
RUN chmod 644 /etc/supervisord.conf

# Install Fluentd
RUN curl -L http://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh | sh
COPY td-agent.client.conf /etc/td-agent/td-agent.conf
RUN mkdir -p /var/log/metering
RUN chown -R td-agent:td-agent /var/log/metering

# Expose the ports we're interested in
EXPOSE 22 8080 9990 24224

CMD ["/usr/bin/supervisord"]