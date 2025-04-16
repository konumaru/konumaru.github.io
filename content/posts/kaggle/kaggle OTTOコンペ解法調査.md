---
title: "kaggle OTTOコンペ解法調査"
date: 2023-05-12T16:56:58+09:00
categories: "kaggle"
tags: [""]

showtoc: true
tocopen: true
searchHidden: false

draft: false
---

## コンペ概要

[コンペページはここ](https://www.kaggle.com/competitions/otto-recommender-system/overview)とは

[ドイツ最大級のオンラインショップOTTO](https://www.otto.de/)を題材に特定のユーザがどの商品に対し、クリック、カート追加、注文するかを予測する。

データはアイテム数180万、ユーザ数1200万人、インタラクション数2.2億が与えられる。これらのデータは４週間のインタラクション履歴からなる。
3週間分をtrain, 残り1週間をtestとして扱う。また、train, testでユーザの重複はない。

評価は、各インタラクション（click, cart, order）ごとにRecall@20の重み付き平均和で計算される。

## 解法の概要

- Model
  - Candidate Generation (Recall)
  - Rerank
- CV Strategy
  - 5%のユーザを使う

## 上位解法

### [1st place solution](https://www.kaggle.com/competitions/otto-recommender-system/discussion/384022)

- Candidate Generation
  - NNでEmbeddingを作成
    - session embedding
    - aid embedding
  - 学習時は上記を使って、positive, negativeサンプリングをそれぞれ行いRerankerが学習するデータを選出
    - cos similiarityが (avg + min) / 2 以上のものをpositiveとする？
- Reranker
  - LGBMRanker
    - Feature
      - session * aidを使ったcandi

## まとめ
