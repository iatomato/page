---
layout: post
author: John G
title: 30 Examples for Shell Script
---

# Linux Shell 脚本封装风格

```termianl
~$ ./foo.sh -c config.json
```

```terminal
~$ ./foo.sh

foo > -c
foo -c > config.json
```

**Yes, the first one is better.**

不需要在类似 'waiting for user input' 界面的设计，而是错误参数报错，提示用户需要 '-h' or '--help' 查看帮助。

<a href="https://raw.githubusercontent.com/iatomato/scripthub/master/shell-style.sh" target="_blank">-拓展例子</a>

# Examples

```terminal
~$ cat <<EOF > list.txt
> 1) a    A   80
> 2) b    B   90
> 3) c    C   87
> 4) d    D   85
> 5) e    E   89
EOF

~$ awk '{print $3 "\t" $4}' list.txt
a    A   80
b    B   90
c    C   87
d    D   85
e    E   89
```
