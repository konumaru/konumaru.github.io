# Marp テーマ集

このリポジトリは[Marp](https://marp.app/)で使用できるテーマテンプレートを提供します。

## 使い方

### テーマの適用方法

Marpのマークダウンファイルの先頭にYAMLフロントマターで指定します：

```yaml
---
marp: true
theme: standard   # ここにテーマ名を指定
---
```

### 利用可能なテーマ

1. **standard** - 青系の標準テーマ
2. **nature** - 緑系の自然テーマ
3. **explaza** - オリジナルの青系テーマ

## テーマの特徴

### 共通の特徴

- 日本語フォントと英語フォントの最適化
- レスポンシブデザイン
- ヘッダー・フッターのサポート
- コードブロックのシンタックスハイライト
- グリッドレイアウトのサポート
- ユーティリティクラス

### スライドの基本設定

```yaml
---
marp: true
theme: standard
paginate: true
header: 'ヘッダーテキスト'
footer: 'フッターテキスト | %DATE% | Page %PAGE% / %TOTAL%'
title: スライドタイトル
description: スライドの説明
---
```

## ユーティリティクラス

以下のCSSクラスが利用可能です：

- `.grid` - 2カラムグリッド
- `.grid-3` - 3カラムグリッド
- `.center` - 中央揃え
- `.flex` - flexboxレイアウト
- `.flex-col` - 縦方向のflexbox
- `.items-center` - アイテムを中央揃え
- `.justify-center` - 水平方向に中央揃え
- `.text-primary` - 主要色でテキスト表示
- `.text-secondary` - 副色でテキスト表示
- `.text-white` - 白色テキスト
- `.bg-primary` - 主要色の背景
- `.small` - 小さいテキスト
- `.large` - 大きいテキスト

## サンプルスライド

`slide/template.md` にサンプルスライドがあります。参考にしてください。

## カスタマイズ

各テーマファイル (`theme/*.css`) を編集することで、テーマをカスタマイズできます。
CSS変数を変更するだけで、簡単に色やサイズを調整できます。

```css
:root {
  --color-primary: #2563eb;   /* 主要色 */
  --color-secondary: #3b82f6; /* 副色 */
  --color-accent: #60a5fa;    /* アクセント色 */
  /* その他の変数... */
}
```
