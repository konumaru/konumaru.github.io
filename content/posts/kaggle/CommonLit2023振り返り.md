---
title: "CommonLit 2023 振り返り"
date: 2023-10-13T13:30:06+09:00
categories: "kaggle"

tags: [""]

showtoc: true
tocopen: true
searchHidden: false

draft: false
---

CommonLitのコンペに参加したので振り返り

## コンペ概要

promptが与えられ、その中にはquestion, title, textがある。

それを生徒？が要約した内容に対し、content, wordingというスコアを着ける。

コンペではそのcontent, wordingのスコアを予測する。

## 取り組んだこと

詳細は[リポジトリ](https://github.com/konumaru/CommonLit2023)にある。
ここでは簡単にまとめる。

- debertaでprompt_question, summary_textを入力にし、content, wordingを予測
- 上記の予測値とテキストを基にした特徴量を合わせて、XGB, LGBMで予測
- XGB, LGBMの予測値をアンサンブル

これでは全く上位には届かなかったので、上位解法見ていく。

## 上位解法

### [2nd place solution](https://www.kaggle.com/competitions/commonlit-evaluate-student-summaries/discussion/446573)

- debertaの入力値を`'Think through this step by step : ' + prompt_question + [SEP] + 'Pay attention to the content and wording : ' + text + [SEP] + prompt_text`とした
  - prompt enginneringがこんなところでも・・・
  - SEPで囲まれた部分はmaskさせる
- 別コンペで学習させたモデルの予測値をつかった？
- モデルの最大長は1280~2048
  - 最終的には2048で学習？
- GroupKFoldで0.4581
- アンサンブル
  - deverta-large
    - mean pooling, lstm pooling
  - deberata-base
    - mean pooling, lstm pooling
  - OpenAssistant/reward-model-deberta-v3-large-v2
    - mean pooling

### [3rd place solution](https://www.kaggle.com/competitions/commonlit-evaluate-student-summaries/discussion/446686)

- prompt_question, summary_textを入力にし、content, wordingを予測
  - 似ているサマリ文章同士で単語の置換を行った（これ思いついたのすごすぎ）
  - 上記でData Augmentationをした
- deberta
  - poolingには、cls tokenとmean poolintを使った
  - token_type_idsを使って、prompt, question, textを区別した（token_type_idsってこういう使い方するんですね）
  - max_lengthは1500

### [4th place solution](https://www.kaggle.com/competitions/commonlit-evaluate-student-summaries/discussion/446524)

- 大量のモデルのアンサンブル
  - deberta large, base
    - layer freeze
    - max_length 1500 ~ 868
  - poolings
    - cls, mean
- GBDTを使ったアンサンブルを使っていたが、最終的にはcvが低かったのでアンサンブルはしなかった
  - 自分の場合途中結果のcvを比較可能にしていなかったのでこれは反省点...

### [5th place solution](https://www.kaggle.com/competitions/commonlit-evaluate-student-summaries/discussion/446584)

- summary, question, title, prompt_textを使用
- deberta largeとlgbmのアンサンブル
  - deberta large
    - max_length 1,536
    - 最初の18layerをfreez
    - content, wordingを同時に学習
  - lgbm
    - public notebookをほぼ同じ（テキスト統計量を中心にしたものだろうか？）
  - アンサンブルは加重平均
- GroupKFold

## まとめ

- deberta largeを使う
- max lengthは1500程度と長めにする
- poolingをcls token, lstm, mean poolingなど多様性を持ったモデルをアンサンブルさせるのが効いた
- stackingよりもbest single modelを追い求める方が重要

と勝つために必要だったことを並べてみると、rtx3060とkaggle notebookだけでは戦えなかった気がする。

deberta largeは試したが、4fold学習しようとするとtimeoutになるし。。

今回は縁がなかったコンペだった。早めに撤退するべきだった。
いいグラボを手に入れた時にまた頑張ろう。
