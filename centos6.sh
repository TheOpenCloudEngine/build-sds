# Install Java
sudo yum clean all; yum update
sudo yum -y install java-1.7.0-openjdk.x86_64
#sudo ln -s /usr/lib/jvm/java-7-oracle /usr/local/java

# Install HAProxy
sudo yum install -y haproxy
sudo cp haproxy.cfg /etc/haproxy/haproxy.cfg
sudo cp /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.default
sudo cp haproxy /etc/default/haproxy
sudo service haproxy restart

# Install Docker
sudo yum install docker-io

# Run sub build script
sudo sh -x build_sub.sh centos6