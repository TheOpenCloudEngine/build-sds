FROM ubuntu:12.04
MAINTAINER Andrea Turli <andrea.turli@gmail.com>

RUN echo 'root:password' | chpasswd

RUN apt-get update
RUN apt-get install -y curl openjdk-7-jdk 

# Install SSH Deamon
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

# Install for Fluentd
RUN apt-get install -y sudo vim net-tools

# Install JBoss
ENV WILDFLY_VERSION 8.1.0.Final
ENV JAVA_OPTS "-Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0"
RUN groupadd -r wildfly -g 433 && useradd -u 431 -r -g wildfly -d /opt/wildfly -s /sbin/nologin -c "WildFly user" wildfly
RUN mkdir /opt/wildfly-$WILDFLY_VERSION
RUN cd /opt && curl http://download.jboss.org/wildfly/8.1.0.Final/wildfly-8.1.0.Final.tar.gz | tar zx && chown -R wildfly:wildfly /opt/wildfly-8.1.0.Final
RUN ln -s /opt/wildfly-$WILDFLY_VERSION /opt/wildfly && chown -R wildfly:wildfly /opt/wildfly
ENV JBOSS_HOME /opt/wildfly

# Install Supervisor
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/
RUN chmod 644 /etc/supervisor/conf.d/supervisord.conf

# Install Fluentd
RUN curl -L http://toolbelt.treasuredata.com/sh/install-ubuntu-precise-td-agent2.sh | sh
COPY td-agent.client.conf /etc/td-agent/td-agent.conf

# Expose the ports we're interested in
EXPOSE 22 8080 9990 24224

CMD ["/usr/bin/supervisord"]