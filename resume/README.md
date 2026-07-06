# 職務経歴書

氏名：小沼塁

学歴：明治大学 総合数理学部 先端メディアサイエンス学科 卒業（2019年3月）

[GitHub](https://github.com/konumaru) / [Zenn](https://zenn.dev/konumaru) / [X](https://x.com/konumaruuu_v2) / [blog](https://konumaru.com/) / [note](https://note.com/konumr) / [SpeakerDeck](https://speakerdeck.com/konumaru) / [Kaggle](https://www.kaggle.com/konumaru)

## 職歴要約

機械学習エンジニアとしてキャリアを開始し、データ解析・プロダクトマネジメントを経て、現在は株式会社エクスプラザのLead AI Producerとして生成AI事業の立ち上げから運用までを一貫して担当しています。クライアントの業務理解から要件定義、プロトタイピング、本番導入・運用までを伴走しながら推進してきました。個人でも日本株AIリサーチサービス「yomitoka」を企画から実装・課金・運用まで単独で開発・提供しています。曖昧な事業課題を整理し、動くAIシステムとして実装しきることが強みです。

## キャリアの変遷

| 期間 | 所属 | 役割 | 獲得した経験 |
| --- | --- | --- | --- |
| 2018/07〜2021/08 | Repro株式会社 | MLエンジニア → アソシエイトPdM | 予測モデル、因果推論、機械学習PoC。後半はPRD/MRD作成、ユーザーヒアリング |
| 2021/09〜2024/08 | note株式会社 | テクニカルプロダクトマネージャー | 推薦・検索・API基盤・UIUX改善。要件定義、A/Bテスト、多職種連携 |
| 2024/09〜現在 | 株式会社エクスプラザ | Lead AI Producer | 生成AI案件の企画〜本番導入、クライアント折衝、社内業務のエージェント自動化 |

## スキル

- **生成AI・LLM**：RAG、AIエージェント、プロンプトエンジニアリング、LLM評価・オブザーバビリティ（Opik、promptfoo）、モデル選定、OpenAI API / Agents SDK
- **データ・機械学習**：レコメンドシステム、因果推論、予測モデル、A/Bテスト（Kaggle Expert）
- **プロダクト**：課題発見、要求・要件定義、UIUX設計、ステークホルダー調整
- **開発**：Python、TypeScript / Next.js、GCP（Cloud Run）、AWS、Supabase、Stripe、Elasticsearch、Playwright

## 職務内容

### 株式会社エクスプラザ — Lead AI Producer（2024/09〜現在）

生成AIスタートアップにて、生成AI事業の立ち上げ、受託・共同開発案件の企画推進、社内業務の自動化を担当。

- 不動産・エンタープライズ・営業マーケティング領域の生成AI案件を、業務理解・要求整理からプロトタイプ設計、開発推進、本番導入まで一気通貫でリード
- 不動産企画を支援するエージェント型AI「project "Camelot"」を立ち上げ（[東京アセットソリューション株式会社との共同開発として公表](https://explaza.jp/news/20251204)）。エージェントのトレーシング・評価にOpikを採用し、トレースに基づくデバッグとLLM出力の評価を運用
- 専門書類からの構造化データ抽出ツール、エンタープライズ向けチャットボット、市場・競合調査AIツールなどをPoCから実装まで推進
- 社内業務へAIエージェントを組み込む「[Biz Agent Ops](https://note.com/konumr/n/n9e5ce3b72543)」を立ち上げ。名刺登録〜HubSpot連携のSlack常駐営業エージェント、スカウト文自動生成Chrome拡張、Playwrightによるフォーム営業自動化などを開発し、副業・業務委託を含む複数名で分担していた業務を1人で遂行できる体制へ移行
- LLMの比較検証、コスト効率を考慮したモデル選定フレームワークの構築、再現性の高いプロンプト設計手法の整理を行い、得た知見を受託開発・社内ツール開発へ展開。生成AI出力の品質監視・評価プロセスも設計

### note株式会社 — テクニカルプロダクトマネージャー（2021/09〜2024/08）

国内最大級のメディアプラットフォームにて、推薦・検索、API基盤、UIUX改善を担当。

- ホーム画面のレコメンドシステムを改善。ルールベースの推薦を構築しA/Bテストで主要指標の改善を確認、本番反映（[公開事例](https://note.com/info/n/na6401a53bdb2)）
- 検索基盤をAWS CloudSearchからElasticsearchへ移行（PdM 1名 + エンジニア2名）。検索精度・カスタマイズ性・運用コストを改善
- 複数データソースをYAML定義で接続できるコンテンツ配信API Hubを企画・開発（PdM 1名 + エンジニア3〜4名）。個別対応だった開発を共通化し、開発スピードを向上
- OpenAI APIを用いた記事カテゴリー分類・コンテンツモデレーションのプロトタイピングで、既存プロダクトへの生成AI活用を検証

### Repro株式会社 — MLエンジニア → アソシエイトPdM（2018/07〜2021/08）

モバイルマーケティングSaaSにて、機械学習機能の検証とプロダクト企画を担当。

- 購買予測モデル、Push配信時間帯の最適化、因果推論を用いたアプリ行動解析など、運用業務を自動化する機械学習機能を検証。プロトタイプを市場に出すためPdMへ転向し、市場調査・ユーザーヒアリング・PRD/MRD作成を担当
- クライアント向けデータサイエンス支援：AWS Redshift + Tableauによる分析基盤・ダッシュボード構築、広告枠のCTR予測モデル、リードスコアリングモデルの構築

## 個人活動

- **[yomitoka](https://yomitoka.com/)** — 日本株AIリサーチサービス。TDnetの適時開示・IR・ニュースを企業別に集約し、週次テーマ・企業フォロー・AIチャットを提供。企画、設計、実装から課金（Stripe、Free/Proプラン）、運用までを単独で担当する本番サービス。promptfooによるプロンプトの回帰テストを実施。Next.js / Supabase / Cloudflare
- **[luanti-agent](https://github.com/konumaru/luanti-agent)** — ボクセルゲームLuanti上のAIエージェント実験基盤。観測・制御API（Luaモッド）、FastAPIボットサーバー、Pythonクライアントで observe→act の制御ループを再現可能なDocker環境として構築
- **Kaggle Expert** — [M5 Forecasting - Accuracy](https://www.kaggle.com/c/m5-forecasting-accuracy)（時系列需要予測）、[CommonLit Readability Prize](https://www.kaggle.com/c/commonlitreadabilityprize)（自然言語処理）、[Predict Student Performance from Game Play](https://www.kaggle.com/competitions/predict-student-performance-from-game-play)（成績予測）で入賞
- そのほか：[pycalf](https://github.com/konumaru/pycalf)（因果推論ライブラリ、PyPI公開）、[nlnomy](https://github.com/konumaru/nlnomy)（コンテンツモデレーション検証アプリ）、[AIミュージックバトル『弁財天』](https://note.com/konumr/n/n89db6c64427e)（VAEによる自動作曲で参加）、[p5gallery](https://konumaru.com/p5gallery/)（メディアアート公開サイト）など

## 技術発信

- [Biz Agent Ops はじめました](https://note.com/konumr/n/n9e5ce3b72543)（note） — 社内業務にAIエージェントを組み込んで自動化する取り組みの言語化
- [Google Cloudで複数プロジェクト環境を便利にCLIだけで扱う方法](https://zenn.dev/explaza/articles/7e53353c6b817c)（Zenn）
- [ElevenLabs APIを使った多言語リアルタイム対話システム作ってみた](https://zenn.dev/explaza/articles/fb0f2a50612397)（Zenn）
- [OpenAI Agent SDKのdocstringsがおかしい](https://zenn.dev/explaza/articles/0148bda2326c4e)（Zenn）
