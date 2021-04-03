---
layout: post
title: ELK (Log System) Deploy
author: John
---

两台主机
IP Address      |Host Name |
----------------|----------|
192.168.122.87  | node0    |
----------------------------
194.168.122.130 | node1    |

*理解 ELK 很重要，远比开 10 个网页标签监控 10 个 hosts 有意义的多*

这里粗略的理解一下，kibana 是一个平台提供 Web 服务软体，而它有很多提供服务的软体，为用户提供各色的功能，而这里的 kibana 有很多功能，面向普通用户与开发人员。

> **Elasticsearch** is a search engine based on the Lucene library. It provides a distributed, multitenant-capable full-text search engine with an HTTP web interface and schema-free JSON documents. 

> **Kibana** is a data visualization dashboard for Elasticsearch. It provides visualization capabilities on top of the content indexed on an Elasticsearch cluster. Users can create bar, line and scatter plots, or pie charts and maps on top of large volumes of data.

*UI UX 本就是两个不同的东西，但每一个都伟大*

## elasticsearch kibana 安装

**目前 node1 不需要安装任何软体**

我们需要 node0 提供 Web 服务，而 node1 就是被 LOG 监视的对象。所以下面的安装，都属于 node0

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

#### Elasticsearch

```
root@node0:/etc/elasticsearch# vim elasticsearch.yml

#下面的配置 是一定要标出的，其余就阅读注释，根据需要设置 可能会因平台版本的不同而会有所不同
cluster.name: node0
node.name: node0

# 本机的 IP 提供 Web 服务需要
network.host: 192.168.122.87
http.port: 9200

# Discovery

discovery.seed_hosts: ["node0", "node1", "node2"]

cluster.initial_master_nodes: ["node0", "node1", "node2"]

# 保存配置 启动服务

root@node0:/etc/elasticsearch# systemctl start elasticsearch.service
root@node0:/etc/elasticsearch# systemctl status elasticsearch.service
● elasticsearch.service - Elasticsearch
     Loaded: loaded (/lib/systemd/system/elasticsearch.service; enabled; v>     Active: active (running) since Wed 2021-03-31 12:47:36 UTC; 6s ago
       Docs: https://www.elastic.co
   Main PID: 6717 (java)
      Tasks: 63 (limit: 1072)
     Memory: 573.5M
     CGroup: /system.slice/elasticsearch.service
             ├─6717 /usr/share/elasticsearch/jdk/bin/java -Xshare:auto -De>             └─6874 /usr/share/elasticsearch/modules/x-pack-ml/platform/li>
Mar 31 12:47:13 node0 systemd[1]: Starting Elasticsearch...

#
root@node0:~# curl '192.168.122.87:9200/_cluster/health?pretty'
{
  "cluster_name" : "node2",
  "status" : "yellow",
  "timed_out" : false,
  "number_of_nodes" : 1,
  "number_of_data_nodes" : 1,
  "active_primary_shards" : 13,
  "active_shards" : 13,
  "relocating_shards" : 0,
  "initializing_shards" : 0,
  "unassigned_shards" : 3,
  "delayed_unassigned_shards" : 0,
  "number_of_pending_tasks" : 0,
  "number_of_in_flight_fetch" : 0,
  "task_max_waiting_in_queue_millis" : 0,
  "active_shards_percent_as_number" : 81.25
}
root@node0:~#
```

#### 配置 Kibana

```
root@node0:/etc/kibana# vim kibana.yml

# 必须存在的配置 其他配置可根据需求配置
server.port: 5601
server.host: "192.168.122.87"
server.name: "node0"
elasticsearch.hosts: ["http://192.168.122.87:9200"]

# 启动 查看 状态 和进程
root@node0:~# systemctl start kibana.service
root@node0:~# systemctl status kibana.service
● kibana.service - Kibana
     Loaded: loaded (/etc/systemd/system/kibana.service; enabled; vendor p>     Active: active (running)
       Docs: https://www.elastic.co
   Main PID: 7000 (node)
      Tasks: 11 (limit: 1072)
     Memory: 134.2M
     CGroup: /system.slice/kibana.service
             └─7000 /usr/share/kibana/bin/../node/bin/node /usr/share/kiba>
Mar 31 13:03:48 node0 systemd[1]: Started Kibana.
root@node0:~# ps -ef | grep kibana
kibana      7085       1 75 13:05 ?        00:00:00 /usr/share/kibana/bin/../node/bin/node /usr/share/kib
root        7098    6630  0 13:05 pts/3    00:00:00 grep --color=auto kibana
```
```
# 在浏览器中打开 192.168.122.87:5601
root@node0:~# chrome 192.168.122.87:5601
```

如果 **Kibana server is not ready yet** 别生气，reboot 绝不是 Linux 该做的，更别说运维人员，你需要一本运维手册，上面写满各种错误笔记，各种给软件开发人员擦屁股的 Errors。

[]()

#### Logstash 安装配置

logstash 安装配置在第二个主机上，因为 node1 需要被 node0 监视

```
root@node1:~# wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
root@node1:~# apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
root@node1~# apt-get update && sudo apt-get install 

#
root@node:/etc/logstash# vim logstash.yml
http.host: 192.168.122.130
path.logs: /var/log/logstash

root@node:/etc/logstash/conf.d# vim syslog.conf
input {
    syslog {
        type => "systemlog"
        port => 10514
    }
}
output {
        elasticsearch {
                hosts => ["192.168.122.87:9200"]
                index => "node-syslog-%{+YYYY.MM.dd}"
        }
}
# 这里的 hosts 是指向 node0 的 kibana，不然。。Logs 给谁

# 配置检查
root@node:/etc/logstash/conf.d# /usr/share/logstash/bin/logstash --path.settings /etc/logstash/ -f /etc/logstash/conf.d/syslog.conf --config.test_and_exit

# 添加 IP 规则

# 保存配置，其他依据需求进行配置 之后启动 查看状态 LOG

root@node:/etc/logstash# systemctl start logstash
root@node:/etc/logstash# systemctl status logstash
● logstash.service - logstash
     Loaded: loaded (/etc/systemd/system/logstash.service; disabled; vendo>     Active: active (running) since Wed 2021-03-31 12:03:40 UTC; 1h 28min >   Main PID: 4376 (java)
      Tasks: 42 (limit: 1072)
     Memory: 602.6M
     CGroup: /system.slice/logstash.service
             └─4376 /usr/share/logstash/jdk/bin/java -Xms1g -Xmx1g -XX:+Us>
Mar 31 13:31:32 node logstash[4376]: [2021-03-31T13:31:32,545][INFO ][logs>Mar 31 13:31:32 node logstash[4376]: [2021-03-31T13:31:32,545][INFO ][logs>Mar 31 13:31:32 node logstash[4376]: [2021-03-31T13:31:32,545][INFO ][l
```
