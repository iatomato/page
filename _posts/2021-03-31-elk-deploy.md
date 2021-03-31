---
layout: post
title: ELK (Log System) Deploy
author: John
---

两台主机

192.168.122.87  | node0 |
----------------|-------|
194.168.122.130 | node1 |

*理解 ELK 很重要，远比开 10 个网页标签监控 10 个 hosts 有意义的多*

这里粗略的理解一下，kibana 是一个平台提供 Web 服务软体，而它有很多提供服务的软体，为用户提供各色的功能，而这里的 kibana 有很多功能，面向普通用户与开发人员。

> Elasticsearch is a search engine based on the Lucene library. It provides a distributed, multitenant-capable full-text search engine with an HTTP web interface and schema-free JSON documents. 

> Kibana is a data visualization dashboard for Elasticsearch. It provides visualization capabilities on top of the content indexed on an Elasticsearch cluster. Users can create bar, line and scatter plots, or pie charts and maps on top of large volumes of data.

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
```
