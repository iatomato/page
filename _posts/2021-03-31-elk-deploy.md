## elasticsearch 安装

```
~$ wget https://artifacts.elastic.co/downloads/kibana/kibana-7.12.0-amd64.deb
~$ wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.12.0-amd64.deb`
~$ sudo dpkg -i elasticsearch-7.12.0-amd64.deb kibana-7.12.0-amd64.deb
```

#### 加入到系统服务中

`systemd`

```
~$ > elasticsearch < ^C
~$ sudo /bin/systemctl daemon-reload
~$ sudo /bin/systemctl enable elasticsearch.service
~$
~$ > kibana < ^C
~$ sudo /bin/systemctl daemon-reload
~$ sudo /bin/systemctl enable kibana.service
```

## 编辑配置文件

```
/etc/elasticsearch$ sudo vim elasticsearch.yml

cluster.name: node2
node.name: node2

# 主机的 IP
network.host: 192.168.122.87
http.port: 9200

# --------------------------------- Discovery ----------------------------------
#
# Pass an initial list of hosts to perform discovery when this node is started:
# The default list of hosts is ["127.0.0.1", "[::1]"]
#
discovery.seed_hosts: ["node0", "node1", "node2"]
#
# Bootstrap the cluster using an initial set of master-eligible nodes:
#
cluster.initial_master_nodes: ["node0", "node1", "node2"]
```
