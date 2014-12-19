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

# Install Docker
curl -sSL https://get.docker.com/ubuntu/ | sudo sh
git clone https://github.com/uengine/docker-jboss.git
cd docker-jboss
sudo docker build -t jboss .

# Install HAProxy
sudo apt-get install -y haproxy
sudo haproxy /etc/default/haproxy
mv /etc/haproxy/haproxy.cfg{,.original}
cp haproxy.cfg /etc/haproxy/haproxy.cfg
sudo service haproxy start
