# Install HAProxy
sudo apt-get install -y haproxy
sudo mv /etc/haproxy/haproxy.cfg{,.original}
sudo cp haproxy.cfg /etc/haproxy/haproxy.cfg
sudo cp haproxy /etc/default/haproxy
sudo service haproxy start
