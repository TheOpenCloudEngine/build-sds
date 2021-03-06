# Install Java
sudo apt-get update
sudo apt-get -y -q install python-software-properties
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get upgrade -y
sudo echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
sudo echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
sudo apt-get -y install oracle-java7-installer
sudo ln -s /usr/lib/jvm/java-7-oracle /usr/local/java

# Install HAProxy
sudo apt-get install -y haproxy
sudo cp haproxy.cfg /etc/haproxy/haproxy.cfg
sudo cp /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.default
sudo cp haproxy /etc/default/haproxy
sudo service haproxy restart

# Adjust time
#
# TODO
#

# Install Docker
curl -sSL https://get.docker.com/ubuntu/ | sudo sh

# Run sub build script
sudo sh -x build_sub.sh ubuntu