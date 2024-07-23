---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
categories: ["{{.Dir | path.Dir}}"]
tags: [""]

showtoc: true
tocopen: true
searchHidden: false
# cover.image: ""

draft: true
---

## Sub Title

hogehoge

![img](images/sample.png)
