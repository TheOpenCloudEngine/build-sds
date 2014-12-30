# Install Java
sudo yum clean all
sudo yum -y install java-1.7.0-openjdk.x86_64
# Install EPEL (Extra Packages for Enterprise Linux) for Docker on CentOS
sudo rpm -iUvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
#sudo yum update -y

# Install HAProxy
sudo yum install -y haproxy
sudo cp haproxy.cfg /etc/haproxy/haproxy.cfg
sudo cp /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.default
sudo cp haproxy /etc/default/haproxy
sudo service haproxy restart

# Adjust time
sudo chkconfig ntpd on
sudo service ntpd stop
sudo ntpdate time.nist.gov
sudo service ntpd start

# Install Docker
sudo yum install docker-io -y
# Start Docker daemon
sudo service docker start
# Configure Docker to start when the server boots
chkconfig docker on

# Run sub build script
sudo sh -x build_sub.sh centos6