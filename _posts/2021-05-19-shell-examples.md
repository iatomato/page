---
layout: post
author: John G
title: 30 Examples for Shell Script
---

Linux Shell 脚本封装风格

```shell
~$ ./foo.sh -c config.json
```

```shell
~$ ./foo.sh

foo > -c
foo -c > config.json
```

**Yes, the first one is better.**

不需要在类似 'waiting for user input' 界面的设计，而是错误参数报错，提示用户需要 '-h' or '--help' 查看帮助。

[-拓展例子](https://github.com/iatomato/scripthub/blob/master/shell-style.sh)
