---
layout: post
title: 显示当前路径下文件与文件夹（优化方案）
author: John
---

```bash
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

[Last edited in 03012021 9:40 PM](https://github.com/iatomato/blogs/blob/master/_posts/2021-03-01-bash-desgin.md)
