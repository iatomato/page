---
layout: post
author: John G
title: 📰 30 Examples for Shell Script
---

# Linux Shell 脚本封装风格

```terminal
~$ ./foo.sh -p="this is command mode"
this is command mode
```

```terminal
~$ ./foo.sh
foo > -p
foo -p > "this is menu mode
this is menu mode
```

**Yes, the first one is better.**

不需要在类似 *'waiting for user input'* 界面的设计，而是错误参数报错，提示用户需要 '-h' or '--help' 查看帮助。

***代码块超过三层，还是重新设计吧！*** 

如果你没学过程序设计，那么，好吧！那样写也很棒棒！

<a href="https://raw.githubusercontent.com/iatomato/scripthub/master/shell-style.sh" target="_blank">-拓展例子</a>

`configure.sh`: A example for a part of configure script

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

`application-notify.sh`: It's a code part of a closed project
```shell
declare _TIMEER=0

_application()
{
        sleep $([ -n "$1" ] && echo $1 || echo 2)
}

while (true); do
        let "_TIMER = _TIMER + 1"
        _application $_TIMER
        notify-send "_application-notify" "$_TIMER"
done
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
