# 2015-1-7 Sang Song 
# sample docker 이미지를 실행하기 위한 스크립트.
# 

cp /etc/haproxy/haproxy.cfg.default /etc/haproxy/haproxy.cfg

sudo docker run -d -P --name node1 jboss:node1 > node1.cid
sudo docker inspect --format='{{.NetworkSettings.IPAddress}}' $(cat node1.cid) > node1.ipaddress
echo "server node1 $(cat node1.ipaddress):8080 check" >> /etc/haproxy/haproxy.cfg

sudo docker run -d -P --name node2 jboss:node2 > node2.cid
sudo docker inspect --format='{{.NetworkSettings.IPAddress}}' $(cat node2.cid) > node2.ipaddress
echo "server node2 $(cat node2.ipaddress):8080 check" >> /etc/haproxy/haproxy.cfg

# Run collector server
sudo docker run -d -P --name collector collector:sample > collector.cid

sudo service haproxy restart