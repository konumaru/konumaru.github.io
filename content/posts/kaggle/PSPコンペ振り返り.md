---
title: "PSPコンペ振り返り"
date: 2023-07-12T20:13:52+09:00
categories: ["Kaggle"]
tags: [""]

showtoc: true
tocopen: true
searchHidden: false

draft: false
---


## コンペ概要

hogehoge

## 解法

### [1st](https://www.kaggle.com/competitions/predict-student-performance-from-game-play/discussion/420217)

- [code](https://www.kaggle.com/competitions/predict-student-performance-from-game-play/discussion/420332)
- GBDT + NNのアンサンブル
  - XGBoost
    - [Treelite](https://github.com/dmlc/treelite)で推論高速化
  - 1dcnn
    - transformerを試したが、同じスコア+軽量だったため1dcnnを採用
- 閾値は0.625で固定
  - 閾値は個別に設定するとモデルの堅牢性が低かった
- 特徴量の数は、各level_groupで 663、1993、3734
- indexをソートしたものと、元の順序の両方のモデルを作成
- cv=0.705

### [2nd](https://www.kaggle.com/competitions/predict-student-performance-from-game-play/discussion/424329)

- 単一のLightGBMで予測
  - level_groupごとにモデルを分けていない
- 5-fold cvで評価、予測用に全データでモデルを学習
- 特徴量生成にはnumba, Cを使った
  - level=1の回答に費やした時間？が効いた
- 特徴量は1,296個
- 閾値は0.63で固定

### [3rd](https://www.kaggle.com/competitions/predict-student-performance-from-game-play/discussion/420235)

- levelごとにモデルを学習（18個の2値分類モデル）
- GBDT + NNのアンサンブル
  - Catboost \* 2, xgb \* 2
  - transformer + lstm
- ローデータをsession_idごとの`index`でソート
- 特徴量の数は、1,000個、2,000個、2,400個
  - 前のlevel_groupからの経過時間
  - 過去質問の予測確率（自分の場合は効かなかった）
  - permutation importanceで特徴量選択
- cv=0.702

### [4th](https://www.kaggle.com/competitions/predict-student-performance-from-game-play/discussion/420349)

- Transformer, XGB, Catboostのアンサンブル
  - 3 seed, 5 fold
- 線形モデルでアンサンブル
- indexでソート後、hover行を削除し再度indexを作成した
- level_groupごとにモデルを学習しているが、nnモデルの共通部分の定義がうまい
- cv=0.704
- 異なる閾値（0.60, 0.62, 0.64）の最終提出３つを選んだ
  - 結果的には0.61が最もprivate scoreが高かった

### [7th](https://www.kaggle.com/competitions/predict-student-performance-from-game-play/discussion/420119)

- level_groupごとにモデルを学習
  - 予測時間短縮のため、levelごとにモデルを分割しなかった
  - 評価時はcv分割したが、推論用には全データで学習したモデルを使用
- 特徴量
  - 集約キーはlevel、name、event_name、room_fqid、fqid、text
  - 集約キーごとの前のイベントとの時間差、カウント
  - event_name=notification_clickのレコードが重要だった（？）
  - 集約キーの組み合わせが多いため、出現回数が低いものは除外した
- モデリング
  - 高い学習率(0.1)で学習し、特徴量重要度(gain)が低いものを除外
  - 低い学習率(0.02)で再度学習
- cv=0.7034
- 閾値は0.625で固定

## 金圏との差分

- 特徴量の数が足りなかった
- Leakを考慮した特徴量重要度を用いた特徴量選択ができなかった
  - 全foldで特徴量重要度を平均して選択するのはダメ
    - 検証用データの特徴量重要度を知ってしまう状態になってしまう
  - foldごとに特徴量重要度を平均し、評価する必要があった
  - jackさんの解法では、最後にcvを切らず全データを使った学習をしているがそのときはfoldごとの特徴量重要度を平均したものを使っている
- 閾値を固定していない
- GBDT + NNのアンサンブルを試していない
