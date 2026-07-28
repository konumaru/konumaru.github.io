---
title: "kaggleコンペ DFL反省会"
date: 2022-10-17T20:51:25+09:00
categories: "kaggle"
tags: ["Kaggle", "CV"]

showtoc: true
tocopen: true
searchHidden: false

draft: false
---

## コンペ概要

ざっくりの概要はサッカーの試合動画(45min \* 2) から特定のフレームで Challenge,
Play, Throwin の３つのイベントを予測するというもの

（合っているか不安だが、）サッカー業界の事情としては、ユース、プロ、セミプロなど
は手厚い指導を受けられるが、それ以外のプレイヤーは質の良い指導を受けられるほど人
材は充実していない。

これを画像処理の技術によって試合中の選手の活動状況を把握することで少ない人的コス
トで選手に有益なアドバイスをできないか、という取り組み。

### 評価指標

公式の説明
は[ここ](https://www.kaggle.com/competitions/dfl-bundesliga-data-shootout/overview/evaluation)

submission file は以下 Columns を必要とした csv ファイルを提出する。

- video_id: 動画の識別子
- time: event が発生した動画内の時間
- event: challenge, play, throwin の内、発生したイベントを１つ
- score: イベントが発生した確率（後に Average Precision を算出するときに使う）

このコンペの評価を簡単に説明すると以下のような計算を行います

- 各 event について Average Precision を計算
- その際に下記の Tolerances (許容度)に従い、正解ラベルとの time の誤差以内であれ
  ば正解とする
  - つまり１つのラベルで time の誤差０であれば５回予測できたとする
- 最後に３つの event の Average Precision の平均値を評価指標とする

```text
# Tolerances
Challenge: [ 0.30, 0.40, 0.50, 0.60, 0.70 ]
Play: [ 0.15, 0.20, 0.25, 0.30, 0.35 ]
Throw-In: [ 0.15, 0.20, 0.25, 0.30, 0.35 ]
```

## 本コンペで難しいと感じた部分

- データが動画
  - 動画によってカメラの画角が捉えてる範囲が異なる
  - 客席も映像に入ってる
- コードコンペだったので CPU/GPU 共に 9 時間の制限がある
- Discussion の情報が乏しい（画像処理の経験が浅いのでつらかった）

（ここの言語化ができてない時点で負けている感がある....）

## 自分が取り組んだ内容

当時の[Repository](https://github.com/konumaru/dfl)

(Private にしていると思うので見れません。)

- Yolov7 で ball, person の x,y,conf を取得
- 時系列テーブルデータとして特徴量エンジニアリング
  - ball の xy 座標と confidence
  - 予測対象フレームの-20~20 のフレーム前後の ball の xy 座標と confidence
  - 予測対象フレームの-20~20 のフレームで rolling した ball の xy 座標と
    confidence の統計量
  - 予測対象フレームの-20~20 のフレーム間で ball が移動したベクトルの内積と角度
  - 検出された person 全員の座標の統計量
- XGBoost で学習、損失関数は LogLoss
- Group=game_id(video_id から前半後半を統合), k=3 の GroupKFold で評価

結果は、ローカルで 0.2 と戦えるスコア出なかった

play だけは 0.7 近く予測できたが、challenge と throwin は 0.02 程度だった

## 上位解法

### [1st Solution](https://www.kaggle.com/competitions/dfl-bundesliga-data-shootout/discussion/359932)

- 4 つの動画を固定で検証用に使った
- 1024\*1024 のグレースケールで前後のフレームを使った 3 チャンネルの画像を使用
  - 処理速度を考慮
- efficientnetv2_b0, efficientnetv2_b1 を使用
  - 3dcnn は pooling 前の最終ブロックと最後の畳み込み層のみ
  - 小さいデータセットに対して過学習することはすぐに分かった
- 損失関数は３つのカラムで BCE
  - ダミーデータはどうしてたんだろう？
- マルチスレッド化して推論を高速化
  - １つの video で 25 min であり、モデルを 2 つしようしたので 50 min
  - 最終的には全体で 5 hours

### [2nd Solution](https://www.kaggle.com/competitions/dfl-bundesliga-data-shootout/discussion/360097)

- オプティカルフロー
  - オプティカルフローを予測？
  - [RAFT というアイデアを使ってる](https://github.com/princeton-vl/RAFT)
- ボールの検出
  - 対象フレームの RGB、前後のオプティカルフローのブレームの RGB の合計 9channel
    を使用
    - 検出された Ball のヒートマップの内、上位 10 に厳選
- ボール軌道のコスト最小化
  - N フレームを対象にボール検出で厳選された 10 の ball から軌道を考慮すると尤も
    らしいものを選定
- イベント分類
  - ボール周辺の画像をトリミングしたものを使用
  - 2D CNN + Ball 軌道特徴量 -> 1D CNN -> 4 Event Class Prediction（短期予測？）
  - Stacking
  - 51 フレームの簡易的な特徴量から中間の７フレームを対象に予測（長期予測？）
- 後処理
  - Play&Pass については７フレームの内？予測値が peek の time を採用
  - Challenge についてはノイズが多かったので予測値にガウシフィルターを適用後同様
    の処理でイベント発生 time を選定

### [3rd Solution](https://www.kaggle.com/competitions/dfl-bundesliga-data-shootout/discussion/360236)

- EfficientNet + Simple 1D UNet
  - input=(1, 64, 3, 360, 640)
  - 前後に 64 フレームも使ってる！？
  - 64 フレーム中で score が peek のフレームを採用
  - Backbone をフリーズさせることで学習を高速化
- ボール検出の pretraining
  - そのまま学習するとオーバーフィットする
  - ボールの位置を教えることで解決
  - ボールの位置は自分でアノテーションした（自分でアノテーションは頭になかった
    ...）
- ラベルデータの加工
  - 正解ラベルを中心に緩やかに正解にする(0~1 のグラデーションを持たせる)
    - 正解ラベルの周辺フレームは event に近い動きをしているはずなのでそのニュア
      ンスを表現することでモデルの FalesNegative を抑制してる？
- Augmentation
  - RandomHorizontalFlip, RandomRotation, ColorJitter, etc
- Loss Function は、Focal Loss
  - Challenge と Throwin はデータが少ないので weight を設定することで調整
- 推論
  - [imutils](https://github.com/PyImageSearch/imutils)で video のデコードを
    MultiTread 化
    - これをつかって動画読み込みむだけで早くなるってことなのか？
- 後処理
  - NSM の閾値に`[12, 6, 6] for [challenge, play, throwin]`と言ってるがどういう
    ことなのだろう

### [5th Solution](https://www.kaggle.com/competitions/dfl-bundesliga-data-shootout/discussion/360331)

- グレースケール、size=(1024,576), crop_center(960,512)
- 前フレームとの差
- 前後 5 フレームの effecientnet_b1 による 3 クラス分類
- 5 モデルのアンサンブル(CV したモデル)
- ラベルデザイン
  - σ=20 フレームのガウス分布
    - 前後 20 フレームについてガウス分布にしたがって緩やかにラベルを付与したって
      ことだろうか

## 上位を取るために

- そもそも NN を使うということ
  - Efficientnet, UNet について要復習
  - 入力の３次元は RGB の color channel だけでなく、時間軸にも使える
- 検証データを固定した試行錯誤の時間の削減
  - 最初は画像サイズを小さくなども
- ガウス分布を使ったラベルの重みづけ
- 動画読み込みの並列化による推論の高速化
- 既存のライブラリやモジュールを活用したスタートラインを高く持つ志
  - 諸刃の剣かもしれんが、少なくとも画像コンペにおいては...？

### お気持ち

「知っていて出来なかったこと」と「知らなくて出来なかったこと」があったように感じ
た

知っていてできなかったことは、今回の問題と紐づかなかったのでどうすればよいのか難
しいが、少なくとも知らなかったことは知っているに変えたい
