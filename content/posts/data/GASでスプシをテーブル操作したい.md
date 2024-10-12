---
title: "GASでスプシをテーブル操作したい"
date: 2024-10-09T10:35:38+09:00
categories: ["posts"]
tags: ["data"]

showtoc: false
tocopen: true
searchHidden: false

draft: false
---

GASを使ってスプレットシートのデータをテーブル風に操作したら便利だった。
そのときのコードのメモ。

pandasのような集計、集約などはGASでやるのはしんどそうなので、そこはスプレットシート側の機能を使うのがよさそうだった。
GASはあくまでCRUDに使うのがよさそう。

## GAS

### Insert

```javascript
function insert(sheet, id, record) {
  sheet.appendRow(record);
  return id;
}
```

### Update

```javascript
function update(sheet, id, record) {
  const data = sheet.getDataRange().getValues();

  for (let i = 1; i < data.length; i++) {
    if (data[i][0] == id) {
      console.log(record.length);
      sheet.getRange(i+1, 1, 1, record.length).setValues([record]);

      return true;
    }
  }

  return false;
}
```

### Upsert

```javascript
function upsert(sheet, id, record) {
  if (update(sheet, id, record)) {
    return id;
  } else {
    return insert(sheet, id, record);
  }
}
```
