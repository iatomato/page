---
layout: post
title: "Python: Streamline or Understandability"
categories: Programming Language
author: John G. Wick
---

![LOGO]({{site.baseurl}}/assets/images/python-logo.jpeg)

> # Table of Contents
* [高階語法](#高階語法)
  * [Streamline](#Streamline)
  * [Understandability](#Understandability)
  * [例子](#)
* [基本資料類型](#基本資料類型)
* [JSON-Library](#JSON-Library)
  * [資料類型](#資料類型)
  * [訪問檔案資料](#訪問檔案資料)
  * [支援函式庫](#支援函式庫)

# 高階語法
### *Streamline*
多数，程序员会对语法深度挖掘，从而使代码行数真正意义上缩短（而不是几行缩一行）一样的执行结果，但是问题在于对新手来说，阅读起来会有些困难。代码维护麻烦。这篇文章，就是了解如何去使用高阶语法。不会罗列出所有高级语法例子，但是万物都有思维。*让你的代码简洁起来*
```python
if (a == 0)
  return 1
else
  return 0
```
變更
```python
if (a == 0)
  return 1
return 0
```
```python
 if (not a | 0)
   return 1
 return 0
```
類似 C 語言的邏輯寫法

### *Understandability*

[Examples](#)

# 基本資料類型

```python
List - [value0, value1, value2]
Dict - {key0: value0, key1: value1, key2: value1}
Tuple - (value0, value1, value2)
```
**List** 和 **Tuple** 之間的簡單區別， **List** 的值可以在程序運行時更改，而 **Tuple** 值不可以更改。
三種資料類型可以相互嵌套，至於如何組合就有什麼樣的效率。

# JSON-Library

> **JSON**（JavaScript Object Notation，JavaScript物件表示法，讀作/ˈdʒeɪsən/）是一種由道格拉斯·克羅克福特構想和設計、輕量級的資料交換語言，該語言以易於讓人閱讀的文字為基礎，用來傳輸由屬性值或者序列性的值組成的資料物件。
> 儘管JSON是JavaScript的一個子集，但JSON是獨立於語言的文字格式，並且採用了類似於C語言家族的一些習慣。<br>
> **JSON 语法规则**
>JSON 语法是 JavaScript 对象表示语法的子集。
>
>   * 数据在名称/值对中
>   * 数据由逗号分隔
>   * 大括号 {} 保存对象
>   * 中括号 [] 保存数组，数组可以包含多个对象
<hr>

### *資料類型*
### *訪問檔案資料*
### *支援函式庫*
