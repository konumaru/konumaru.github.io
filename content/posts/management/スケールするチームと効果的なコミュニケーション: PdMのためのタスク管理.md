---
title: "スケールするチームと効果的なコミュニケーション: PdMのためのタスク管理"
date: 2023-08-22T10:14:52+09:00
categories: [""]
tags: [""]

showtoc: true
tocopen: true
searchHidden: false

draft: false
---

この記事ではPdMとしてしばらく働いて、扱うリソースが10人を超えそうになってきたときにマネージメントコストが爆増してしんどくなったときに回避した方法を記録に残すために書いたもの。

one team one pizzaの思想のもの動いていたが上記の体制じゃお腹いっぱいになれない。
ということでどうやってチームを分割して、その動きを制御するのかを考えた結果になる。

特に今回はスケーラブルな組織となることを目指している。

## 導入

PdMの役割は事業目標にコミットしつつ、あらゆる手を使って製品のあるべきを模索することだと私は思っている。

ただし、会社によってはチームをマネージメントすることも求められることもあると思います。そう言ったときPdMの役割を果たしつつ、チームが最も機能できる状況を作り出すためにはどうすればいいのかを考えた。

本来ならEM, Scrum Masterなどの役割の人たちと協力して組織形成をやりたいところだが、今回はそういった役割の人がいないものとする。

## 組織体制の想定

大体こんな感じ↓

{{<mermaid align="left">}}
graph TD;
 A(Board) --> B_Top(PO)
 B_Top(PO) --> B(PdM)
 B_Top(PO) --> B_dash(PdM)
 B(PdM) --> T1(TeamA)
 B(PdM) --> T2(TeamB)
 B(PdM) --> T3(TeamC)
{{< /mermaid >}}

PdMのポジションが自分であり、TeamA, TeamB, TeamCのPdMを兼任しているという想定。
またTeamが増えることを許容することでスケーラブルであると仮定している。

Teamは3~5人程度の小規模なものを想定している。

## タスク管理の目的

タスク管理の目的は、**このままいけば事業計画から逆算されたチームが到達するべき目標を完遂することができるか、そうでない場合そのチームの目標の方向修正が必要かを判断するためコミュニケーションを円滑にすることである。**

上記を達成するためPdMがチームや上位下位レイヤー間のコミュニケーションをする際に自分の頭で考え整理できるように情報を俯瞰できる必要がある。

そのインプットがあることでタスクの進展や情報、見積りのアプデート、リソース配分の再検討などの提案をチームや上位レイヤーに提案することも可能になる。

決して「進捗管理」をしたいのではなくPdM <-> Team間で事業目標を達成するために今何をするべきうかを一緒に考えるためのものと考えたい。

ここからはぼやきだが、そうしないとPdMが事業成長の限界値になってしまいかねないし、PdMは自己投資する時間を非常に取りにくい。（すごい人は違うのかもしれないけど）

## 実践的なタスク管理方法

前提として以下を設ける。

- 先半年から１年分くらいの事業計画はすでに存在するものとする
- 半期の事業目標の明確に決まっているものとする
- Teamの目標管理はOKRの形式で運営されている

OKRで設定されたKR＝Epic or Parent Epicとする。

OKRについては、[googleのre:work](https://rework.withgoogle.com/jp/guides/set-goals-with-okrs/steps/introduction/)や[OKR（オーケーアール）という書籍](https://www.amazon.co.jp/dp/B07B2R1ZDL)がわかりやすい。

Epicの考え方については、[Atlassianのブログ](https://www.atlassian.com/ja/agile/project-management/epics-stories-themes)や[Gitlabのブログ](https://docs.gitlab.com/ee/user/group/epics/)が参考になった。j

こうすることで事業目標を表現したOKRが立てられ、KR=Epicの構図が出来上がり、各開発チームがEpicを消化することで事業目標達成にコミットできることとなる。

### Epicを完結させるためのSprintを計画する

ざっと調べた感じ基本的にEpicという考え方はスクラムの文脈でしか語られてなかったので、チームはスクラムのような形式をとっているものとする。（そうでないならスクラムに変えよう。）

Epicを完結させるためには、Epicを分割してSprint Backlog Itemを作成し、それを完結させることでEpicを完結させることができる。チームはこれを継続するだけで良くなる。

{{<mermaid align="left">}}
graph TD;
 A(Parent Epic) --> Epic(Epic)
 Epic(Epic) --> TaskA(Task)
 Epic(Epic) --> TaskB(Task)
 Epic(Epic) --> TaskC(Task)
 TaskA(Task) --> BacklogItemA(Sprint Backlog Item)
 TaskC(Task) --> BacklogItemB(Sprint Backlog Item)
 TaskC(Task) --> BacklogItemC(Sprint Backlog Item)
{{< /mermaid >}}

またEpicは以下のようにガントチャートにすることで体外的にスケジュールを公開することもでき、軌道修正するときに「EpicA_2が2週間ほど遅れそうですー」と言った時の影響範囲なども説明しやすい。

{{<mermaid align="left">}}
gantt
 title Epic Timeline
 dateFormat YYYY-MM-DD

 section Parent_EpicA
  EpicA_1 :a1, 2025-04-01, 14d
  EpicA_2 :a2, after a1, 9d
  EpicA_3 :a3, after a2 , 42d

 section Parent_EpicB
  EpicB_1 :b1, 2025-04-01, 21d
  EpicB_2 :b2, after b1, 14d

 section Nan_Parent
  EpicC :c1, 2025-04-14, 7d
  EpicE :d, 2025-04-21, 14d
  EpicF :e, 2025-04-21, 28d
{{< /mermaid >}}

また、Epicをユーザーストーリー形式にするか、機能名にするかという議論がある。

個人的にはザッと情報を把握したいときには機能名のほうが見やすいので少なくともタイトルは機能名にしたい。機能名出ないにしても短く完結な表現をしてほしい。

ちなみに機能単位でロードマップを公開している企業をいくつか参考にした。

参考：[unreal engine](https://portal.productboard.com/epicgames/1-unreal-engine-public-roadmap/tabs/88-unreal-engine-5-3-in-progress), [GitHub public roadmap](https://github.com/orgs/github/projects/4247), [B4/3](https://smartbank.co.jp/roadmap)

### Epicの項目テンプレート

Epicは大体これくらいの項目があると良いと思う。

```plaintext
# タイトル
## 概要
（概要を記述してください）

## 背景
（何が問題であるか、なぜその問題が生じたか、なぜそのタスクが重要なのかなどの背景情報を記述してください）

## 関係者
（タスクに関係する人や組織を記述してください）

## 期間
（タスク完了にかかる見積もり期間を記述してください）

## タスク
（epicを完了するために必要な具体的なタスクを記述してください）

## リスクや障害
（タスクを完了するために、リスクや障害物が発生する可能性やどのように対処するかを記述してください）

## 完了後の成果物
（タスクの完了後にどのような成果物が得られるかを記述してください）

## 成果指標
（Epicによって事業観点からの成果指標を記述してください）

## 期待する事業への影響
（新規事業の立ち上げ、売り上げ向上、PV数の向上、etc）

## 参考情報
（その他の情報や注釈があれば追加してください）
```

## まとめ

今のところ自分がチーム運営のキャパが溢れそうなときに取った対策をまとめた。

まだまだEpicの粒度のバラツキや事業設定をOKRに落とし込むときの難しさなどを感じてはいるが、チームとPdMが認識を合わせたり少し将来の話をする難易度がグッと下がっているのを感じる。

そう言った意味でも**チームを管理や制御をしたいのではなくコミュニケーションを取りたいのだというスタンスを持つことが大事**だと思った。
