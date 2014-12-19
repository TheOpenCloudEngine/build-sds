# Install HAProxy
sudo apt-get install -y haproxy
sudo cp haproxy.cfg /etc/haproxy/haproxy.cfg
sudo cp /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.default
sudo cp haproxy /etc/default/haproxy
sudo service haproxy start
