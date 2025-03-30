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

### レイアウト

- `.grid` - 2カラムグリッド（等幅）
- `.grid-3` - 3カラムグリッド（等幅）
- `.center` - 中央揃え（テキストと要素）
- `.flex` - flexboxレイアウト
- `.flex-col` - 縦方向のflexbox
- `.items-center` - アイテムを中央揃え（垂直方向）
- `.justify-center` - 水平方向に中央揃え
- `.gap-[size]` - 要素間の間隔（size: xs, sm, md, lg, xl）

### テキストと色

- `.text-primary` - 主要色でテキスト表示
- `.text-secondary` - 副色でテキスト表示
- `.text-white` - 白色テキスト
- `.bg-primary` - 主要色の背景
- `.bg-secondary` - 副色の背景
- `.bg-accent` - アクセント色の背景
- `.small` - 小さいテキスト（0.8em）
- `.large` - 大きいテキスト（1.2em）
- `.bold` - 太字テキスト

### 使用例

```markdown
<!-- 2カラムレイアウトの例 -->
<div class="grid">

## 左側のコンテンツ
テキストや画像

## 右側のコンテンツ
テキストや画像

</div>

<!-- 中央揃えのコンテンツ -->
<div class="center">

# 中央揃えのタイトル
中央揃えのテキスト

</div>
```

## サンプルスライド

`slide/examples/` にサンプルスライドがあります。実際の使用例も用意しています。

## カスタマイズ

各テーマファイル (`theme/*.css`) を編集することで、テーマをカスタマイズできます。
CSS変数を変更するだけで、簡単に色やサイズを調整できます。

```css
:root {
  --color-primary: #2563eb;   /* 主要色 */
  --color-secondary: #3b82f6; /* 副色 */
  --color-accent: #60a5fa;    /* アクセント色 */
  --font-sans: 'Noto Sans JP', 'Helvetica Neue', Arial, sans-serif;
  --font-serif: 'Noto Serif JP', 'Times New Roman', serif;
  --font-mono: 'Fira Code', 'SFMono-Regular', Consolas, monospace;
  --text-size-base: 24px;     /* 基本文字サイズ */
  --heading-weight: 600;      /* 見出しの太さ */
  /* その他の変数... */
}
```

新しいテーマを作成する場合は、既存のCSSファイルをコピーして変数を変更するのが最も簡単です。
作成したテーマは `theme/` ディレクトリに配置し、マークダウンのフロントマターで指定します。
