---
layout: post
title: "ansible: ansible-playbook 基本使用"
author: John G. Wick
categories: Tutorials
---

![ansible-playbook]({{site.baseurl}}/assets/images/R842b5e4d70b8004cdf6a526e12ee7545.png)
> ansible-playbook 运行结构

> ansbile-playbook是一系统ansible命令的集合，其利用yaml 语言编写，运行过程，ansbile-playbook命令根据自上而下的顺序依次执行。同时，playbook开创了很多特性,它可以允许你传输某个命令的状态到后面的指令,如你可以从一台机器的文件中抓取内容并附为变量,然后在另一台机器中使用,这使得你可以实现一些复杂的部署机制,这是ansible命令无法实现的。

> 参数-k(–ask-pass) 和 -K (–ask-sudo) 来询问ssh密码和sudo密码,-u指定用户,这些指令也可以通过规定的单元写在playbook。

> 示例

```ansible-playbook
- name: create user
host: all
user: root
gather_facts: false
vars:
 user: "test"
tasks:
- name: create user
user: name="{{ user }}"
```
`playbook` 实现新增一位用户：<br>

`name` 参数 create user 功能的概述，当执行到后面 (user: nam...)会打印 name 变量的值；<br>

`hosts` 参数指定了对那些主机进行参考；<br>

`user` 参数指定了使用什么用户登录远程主机操作；<br>

`gather_facts` 参数指定了在以下任务部分执行前，是否先执行setup模块获取主机相关信息，这在后面的task会使用到setup获取的信息时用到；<br>

`vars` 参数，指定了变量，这里指字一个user变量，其值为test ，需要注意的是，变量值一定要用引号引住；<br>

