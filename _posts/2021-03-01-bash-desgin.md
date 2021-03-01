---
layout: post
title: 显示当前文件夹下文件（优化方案）
author: John
---

```
#!/bin/bash

clear
total=`ls | wc -l`

for di in `ls`; do
        echo " /${di}"
done

while (true); do
        tmp=`ls | wc -l`
        if [ ${total} != ${tmp} ]; then
                clear;
                for di in `ls`; do
                        echo " /${di}"
                done
                total=`ls | wc -l`
        else
                total=`ls | wc -l`
        fi
        sleep 5
done
```
