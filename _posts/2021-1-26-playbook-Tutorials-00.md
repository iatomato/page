---
layout: post
title: "ansible-playbook: playbook 基本使用"
author: John G. Wick
---

![ansible-playbook]({{site.baseurl}}/assets/images/R842b5e4d70b8004cdf6a526e12ee7545.png)
> ansible-playbook 运行原理

> ansbile-playbook是一系统ansible命令的集合，其利用yaml 语言编写，运行过程，ansbile-playbook命令根据自上而下的顺序依次执行。同时，playbook开创了很多特性,它可以允许你传输某个命令的状态到后面的指令,如你可以从一台机器的文件中抓取内容并附为变量,然后在另一台机器中使用,这使得你可以实现一些复杂的部署机制,这是ansible命令无法实现的。

> 参数-k(–ask-pass) 和 -K (–ask-sudo) 来询问ssh密码和sudo密码,-u指定用户,这些指令也可以通过规定的单元写在playbook。
