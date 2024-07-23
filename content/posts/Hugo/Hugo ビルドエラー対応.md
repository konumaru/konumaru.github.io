---
title: "202209時点で起きたHugoビルドエラー対応"
date: 2022-09-13T10:57:52+09:00
categories: ["Hugo"]
tags: [""]

showtoc: true
tocopen: true
searchHidden: false

draft: false
---

## 経緯

- 諸事情により、PC を新しくしたところ hugo server がローカルで起動しなくなった
- よく確認せずに Github Actions へビルドしたら CI は通過したのでローカル環境の問題だと推測した

## エラーメッセージ

hogehoge

```sh
❯ hugo server -D
Start building sites …
hugo v0.102.3+extended darwin/amd64 BuildDate=unknown
WARN 2022/09/13 10:56:07 found no layout file for "HTML" for layout "archives" for kind "page": You should create a template file which matches Hugo Layouts Lookup Rules for this combination.
WARN 2022/09/13 10:56:07 found no layout file for "HTML" for kind "term": You should create a template file which matches Hugo Layouts Lookup Rules for this combination.
WARN 2022/09/13 10:56:07 found no layout file for "HTML" for kind "term": You should create a template file which matches Hugo Layouts Lookup Rules for this combination.
WARN 2022/09/13 10:56:07 found no layout file for "HTML" for kind "page": You should create a template file which matches Hugo Layouts Lookup Rules for this combination.
WARN 2022/09/13 10:56:07 found no layout file for "HTML" for kind "term": You should create a template file which matches Hugo Layouts Lookup Rules for this combination.
WARN 2022/09/13 10:56:07 found no layout file for "HTML" for kind "term": You should create a template file which matches Hugo Layouts Lookup Rules for this combination.
WARN 2022/09/13 10:56:07 found no layout file for "HTML" for kind "page": You should create a template file which matches Hugo Layouts Lookup Rules for this combination.
WARN 2022/09/13 10:56:07 found no layout file for "HTML" for kind "term": You should create a template file which matches Hugo Layouts Lookup Rules for this combination.
WARN 2022/09/13 10:56:07 found no layout file for "HTML" for kind "home": You should create a template file which matches Hugo Layouts Lookup Rules for this combination.
WARN 2022/09/13 10:56:07 found no layout file for "HTML" for layout "search" for kind "page": You should create a template file which matches Hugo Layouts Lookup Rules for this combination.
WARN 2022/09/13 10:56:07 found no layout file for "HTML" for kind "taxonomy": You should create a template file which matches Hugo Layouts Lookup Rules for this combination
```

## 対応

原因は、サブモジュールを初期化&更新する必要があった

```sh
> git submodule update --init --recursive
```

更新するだけでなく、初期化が必要な部分でつまづいた。
