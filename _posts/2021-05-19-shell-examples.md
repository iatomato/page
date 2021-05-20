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

## A example for a part of configure script

```shell
...
declare prefix_path
declare cache_path
declare node_path
declare config_path
declare script_name
declare logs_path
declare null_path=/dev/null

declare readonly _max=$#
for (( declare index=1; i <= $_max; ++index ))
do
    case "$index" in
        "prefix_path=*") prefix_path=${index#*=};;
        "cache_path=*") cache_path=${index#*=};;
        "node_path=*") node_path=${index#*=} ;;
        "config_path=*") config_path=${index#*=} ;;
        "script_name=*") script_name=${index#*=} ;;
        "logs_path=*") logs_path=${index#*=} ;;
        "null_path=*") null_path=${index#*=} ;;
    esac
done

readonly perfix_path
readonly cache_path
readonly node_path
readonly config_path
readonly script_name
readonly logs_path
readonly null_path
...
```
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
