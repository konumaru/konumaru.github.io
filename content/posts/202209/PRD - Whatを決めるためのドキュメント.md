---
title: "PRD - Whatを決めるためのドキュメント"
date: 2022-09-28T14:46:50+09:00
categories: ["ProductManagement"]
tags: ["PdM"]

showtoc: true
tocopen: true
searchHidden: false

draft: false
---

## これを読んで得られるもの

PM, Desingner, Developer の間で、何を、何故作るのかの共通認識を作るための手段

## PRD とは

- 「プロダクトマネージャー本人も含めて、常に立ち返るべき方針」をドキュメントにしたもの
- ブレの無い意思決定をするため
- 開発終盤に入り期日も近づいた時の取捨選択を判断する基準

## PRD のテンプレート

以下は [Product Hunt](https://docs.google.com/document/d/1yrU5F6Gxhkfma91wf_IbZfexw8_fahbGQLW3EvwdfQI/edit) のものを参照している。

```txt
1. Intro & Goal
2. Product Vision
3. Who's it for? ｜誰のためにあるか
4. Why build it?｜なぜ創るか
5. What is it?｜どういうものか
   5–1. Glossary ｜用語
   5–2. User Types
   5–3. UI/Screens/Functionalities ｜ UI/画面/機能
6. Brainstormed Ideas ｜その他アイデア
7. Competitors & Product Inspiration ｜競合
8. Seeding Users & Content ｜初期ユーザーと獲得戦略
9. Mockups
10. Tech Notes
```

## PRD を書くステップ

<!--
ref: https://productschool.com/blog/product-management-2/product-template-requirements-document-prd/
-->

1. 素案を書く
   - Good Idea をプライベートドキュメントに書いてみる
   - 言語化の過程で自らが間違っていたことに気づくかもしれません
   - Backgroud, Objective, metrics は最低限欲しい
     - さらに、ユーザーが利用するシナリオ、主要機能を言語化できると素晴らしい
2. 上長の承認を得る
   - 上司の考えやフィードバックを入手するのが目的
     - 自分よりもドメイン知識を豊富に持っている人の意見は貴重です
   - また情報の透明性にも繋がります
3. デザイナーと共有
   - エンジニアリングについて語る前にユーザーに触れさせるのが懸命です
   - デザイナーの意見を積極的に仕様に反映させましょう
4. エンジニアと共有
   - （理想的には）デザイナーとエンジニアのリーダーと PRD を共有し、フィードバックを得ます
   - 技術的に実現可能なものを見つけ、大まかな時間・難易度の見積りを行う
5. プロダクトチーム全体に共有
   - この時点で正式に会社の wiki に PRD を移動
   - チームから得た質問や情報を PRD に記録していきます
     - プロダクトチームから良きアイデアが出た場合、初期に実現しないとしてもここにメモします
6. 会社に共有
   - 必要に応じて、プレゼンテーションの材料とすることができます
