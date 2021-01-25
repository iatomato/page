---
layout: post
title: "Python: Streamline or Understandability"
categories: Programming Language
author: John G. Wick
---

![usefulimage](https://opieters.github.io/jekyll-image-gallery-example/photography/ghent-light-festival.html)

> # Table of Contents
* [高階語法](#高階語法)
  * [Streamline](#Streamline)
  * [Understandability](#Understandability)
  * [例子](#)
* [基本資料類型](#基本資料類型)
* [JSON](#JSON)
  * [資料類型](#資料類型)
  * [訪問檔案資料](#訪問檔案資料)
  * [支援函式庫](#支援函式庫)

# 高階語法
### *Streamline*

簡短而有效率
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

# JSON

> **JSON**（JavaScript Object Notation，JavaScript物件表示法，讀作/ˈdʒeɪsən/）是一種由道格拉斯·克羅克福特構想和設計、輕量級的資料交換語言，該語言以易於讓人閱讀的文字為基礎，用來傳輸由屬性值或者序列性的值組成的資料物件。
> 儘管JSON是JavaScript的一個子集，但JSON是獨立於語言的文字格式，並且採用了類似於C語言家族的一些習慣。

### *資料類型*
### *訪問檔案資料*
### *支援函式庫*
