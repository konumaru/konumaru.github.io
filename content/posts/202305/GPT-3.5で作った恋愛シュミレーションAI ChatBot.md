---
title: "GPT-3.5で作った恋愛シュミレーションAI ChatBot"
date: 2023-05-02T15:01:42+09:00
categories: [""]
tags: [""]

showtoc: true
tocopen: true
searchHidden: false

draft: true
---

## 何を作ろうと思ったのか

ひとことで言うと「マッチングアプリに変わる恋愛シュミレーションAI」を作りたかった。

ChatGPTを使ってみたところかなり自然に会話をしてくれたので、まるで人と話しているかに感じることができた。
それを受けてプロンプトで人格を定義して、シュミレーションゲーム風にして人と話すことを目的にしているマッチングアプリユーザをリアルの人と関わることによるストレスから解放できないかと思いつくってみることにした。

## 出来上がったもの

[詳細はGithubを参照してください。](https://github.com/konumaru/love_simulation_chatbot)

正直人と話ている状態とはほど遠く、実験的に作った４択形式のインターフェースが楽ではあったがリアルから離れすぎてしまった。

## プロンプトエンジニアリングの難しさ

jsonで出力されることが担保されるなら[Messaging APIで提供されているクイックリプライを使いたかった](https://developers.line.biz/ja/docs/messaging-api/using-quick-reply/)

## LINEというインターフェースの良さ

## 完成までの反省点

遅い。
