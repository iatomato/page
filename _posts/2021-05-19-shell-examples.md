---
layout: post
author: John G
title: 📰 30 Examples for Shell Script
---

<span style="color:blue; font-size:15px"><ins> *What's (C) in this post?*</ins></span><br>
<span style="color:blue; font-size:15px"><ins> *This article is about the legal symbol.*</ins></span><br>
<span style="color:blue; font-size:15px"><ins> *存在标志的代码，原作者享有所有权*</ins></span>

# Linux Shell 脚本封装风格

```terminal
~$ ./foo.sh -p="this is command mode"
this is command mode
```

```terminal
~$ ./foo.sh
foo > -p
foo -p > "this is menu mode"
this is menu mode
```

**Yes, the first one is better.**

不需要在类似 *'waiting for user input'* 界面的设计，而是错误参数报错，提示用户需要 '-h' or '--help' 查看帮助。

***代码块嵌套超过三层，还是重新设计吧！*** 

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

`(C) application-notify.sh`: It's a code part of a closed project
```shell
...
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
...
```

`(C) **vtl.sh`: A part
```shell
...
_notify()
{
        notify-send -t 3000 "v2ctl" "$1"
}

if [ -n "$1" ]; then
        case "$1" in
                "--help"|"-h"|"help") tips_help;;
                "--status"|"-e"|"status")
                        if [ $ini_pid -eq 0 ]; then
                                _notify \
                                        "Service $service_name is running with PID \
                                        $(sleep $_timer && \
                                        pidof $service_name)"
                        elif [ $ini_pid -eq 1 ]; then
                                _notify "Service is stopped"
                        fi
...
...
elif [ $ini_pid -eq 1 ] && [ $nexists -eq 1 ]; then
    `${core_dir} -c ${select_node_dir} > \
        $inter_log_dir 2>&1 \
        &` && sleep 1 && \
        notify-send \
        -i important \
        -t 3000 \
        "v2ctl" \
        "Start Services Sucessfull\n PID \
        $(sleep $_timer && pidof v2ray)"
...
```

提高代码的复用性，这就是为什么要有 Functions

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

### 1

> 请按照这样的日期格式（xxxx-xx-xx）每日生成一个文件，
> 例如生成的文件名为2017-12-20.log， 
> 并且把磁盘的使用情况写到到这个文件中，
> 不用考虑cron，仅仅写脚本即可

```shell
#!/bin/bash
# Written by Wick Jr.

declare _DATE=$(date +"%F")
declare _NEXT_DATE=$(date --date="yesterday" +"%F")
declare readonly _DIR_PATH="/tmp/data/"
declare _FILE_NAME=$_DATE.log

[ ! -d $_DIR_PATH ] && mkdir $_DIR_PATH || df -h > $_DIR_PATH/$_FILE_NAME
```

### 2

> 有日志1.log，部分内容如下
>> 112.111.12.248 – [25/Sep/2013:16:08:31 +0800]formula-x.haotui.com “/seccode.php?>> update=0.5593110133088248″ 200″http://formula-x.haotui.com/registerbbs.php” “Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1;)”
>> 61.147.76.51 – [25/Sep/2013:16:08:31 +0800]xyzdiy.5d6d.com “/attachment.php?aid=4554&k=9ce51e2c376bc861603c7689d97c04a1&t=1334564048&fid=9&sid=zgohwYoLZq2qPW233ZIRsJiUeu22XqE8f49jY9mouRSoE71″ 301″http://xyzdiy.5d6d.com/thread-1435-1-23.html” “Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)”
> 统计出每个IP访问量有多少

```shell
#!/bin/bash
```

### 3

> 写一个脚本计算一下linux系统所有进程占用内存大小的和。

```shell
#!/bin/bash

declare _TOTAL_U=0
for _G in $(ps aux | grep -v 'TIME COMMAND' | awk '{ print $6 }')
do
    _TOTAL_U=$(( $_TOTAL_U+$_G ))
done
echo "Total: $_TOTAL_U"
```

### 4

>  设计一个脚本，监控远程的一台机器(假设ip为180.163.26.39)的存活状态，当发现宕机时发一封邮件给你自己。

```shell
#!/bin/bash
```

### 5

> 找到/123目录下所有后缀名为.txt的文件
> - 1. 批量修改.txt为.txt.bak
> - 2. 把所有.bak文件打包压缩为123.tar.gz
> - 3. 批量还原文件的名字，即把增加的.bak再删除


[<span style="color:blue; font-size:15px"><ins>*Source Code of This Post*</ins></span>](https://raw.githubusercontent.com/iatomato/blogs/master/_posts/2021-05-19-shell-examples.md)
