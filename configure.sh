cp /etc/haproxy/haproxy.cfg.default /etc/haproxy/haproxy.cfg

for i in {1..2}
do
        docker run -d -P --name node$i jboss > node$i.cid
        sudo docker inspect --format='{{.NetworkSettings.IPAddress}}' $(cat node$i.cid) > node$i.ipaddress
        echo "server node$i $(cat node$i.ipaddress):8080 check" >> /etc/haproxy/haproxy.cfg
done

service haproxy restart
