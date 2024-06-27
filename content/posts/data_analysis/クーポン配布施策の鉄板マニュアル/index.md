---
title: "クーポン配布施策の鉄板マニュアル"
date: 2024-06-13T19:13:08+09:00
categories: ["data analysis"]
tags: [""]

showtoc: true
tocopen: true
searchHidden: false
# cover.image: ""

draft: false
---

## はじめに

この記事ではクーポン配布施策について書いていく。

こういった施策をやるよ、となったときに自分なりのテンプレートがあるのであとで思い出せるように残しておこうと思った。

## クーポン配布の背景と目的

クーポン配布の目的はさまざま考えられるが、この記事内では以下のような目的とする。

1. 売り上げを伸ばしたい
1. 予算を使い切りたい

１は、主に新規ユーザーの獲得や１人あたりの購買単価を上げることが考えられる。

２は、配布したクーポンをユーザーが利用することで予算が消費される。

## 過去データから考える

最終的に決定するディスカウント条件については、話をシンプルにするために今回は「X円以上の購入でY円割引」という形で考える。ここから先ではこのX, Yを決定する。

過去の適当な期間を対象に、ユーザー１人あたりの購買単価をヒストグラムを見ることから始める。
適当な期間とは、直近1ヶ月や3ヶ月など適当な期間で良い。さらにサービスのドメイン知識があるならユーザーが離反する期間を考慮するといい。

大体こういうのは下図のようなロングテールのグラフになるだろ、という仮定でデモデータを生成した。
X軸は１人あたりの購買金額、Y軸はその金額を購入したユーザー数を表している。

![img](images/arpu.png)

このグラフは左側であるほど無課金・低課金ユーザー、右側であるほどが重課金ユーザーとなる。

結論から言うと売り上げを上げるポテンシャルがあるユーザーは左側のユーザーであり、クーポンの配布対象のユーザーとなる。

仮に右側のユーザーにクーポンを配布したとすると、彼らはすでに買いたいものが明確であり、クーポンがなくても購買行動をする。そのため事業者側からするとただ値下げをしているだけであり、売上を伸ばすことは難しい。

昔聞いた「行列ができるラーメン屋の行列にトッピング無料券を配布しても意味ないでしょ？」と言う例えがわかりやすかった。

しかし無課金ユーザーのみだとそもそも欲しいものがなかったり、サービスから離反しきっている可能性がありディスカウント件を配布しても期待される効果が薄い。

つまり、どこにディスカウント条件設けるといいかというと、程よく欲しいものがあり、サービスを離反していないユーザーがいそうなところに基準（＝X）を設けるとよい。

最初は以下のように大体でいい。大体でいんです、最初は。

![img](images/arpu_threshold.png)

生成されたサンプルデータから **今回はX=1,000円, Y=20%という条件でディスカウントを適用することにする。** わかりやすくいうと「1,000円以上の購入で200円割引」ということ。

## ユーザーに価値が伝わるUXを考える

せっかくお金を配って、ユーザーにとってメリットもあるはずなのに、それが伝わらないと意味がない。
またユーザーがそれを受け入れやすいような意味づけをすることも重要。

とはいえ難しい話ではなくて、以下のようなことを指している。

見せ方で言うと、1,000円以上の購入で200円割引、2 Buy 1 Get 1 Free、10,000円以上で送料無料、などがある。

動機付けで言うと、誕生日、初回購入、時間制限付き

とにかくユーザーがメリットを感じるかを確認することが重要。

## レポーティングの雛形

Outlineは、

- ディスカウント条件の決定理由
- ディスカウント条件の詳細
  - X円以上の購入でY円割引
  - 有効期限
  - 適用条件
- 配布実績
  - 配布ユーザー数
  - クーポン利用率
  - 平均購買単価の変化
  - 購買UU数の変化
- ディスカウント条件の変更案

大体こう言うことを書いておけばよくて、クーポン配布後の購買単価の分布は大体以下のようになる。

[「データ分析の力 因果関係に迫る思考法」](https://www.amazon.co.jp/dp/4334039863/ref=cm_cr_lh_d_bdcrb_top)では、集積分析という名前で紹介されている。

![img](images/arpu_coupon.png)

ちなみに、今回のサンプルデータでは以下のように変化した。

- 通常時
  - 平均購買単価: 916 円
  - 累計購買金額: 91,618,703 円
- クーポン適用後
  - 平均購買単価: 963 円
  - 累計購買金額: 96,305,593 円

平均購買単価が、約5%上昇したことになる。

あとは先ほど決めた、X,Yやユーザーへの伝え方を変えるABテストを繰り返すことで、より効果的なディスカウント条件を見つけることができる。

## マニュアルが機能する前提条件

ここまでみてもらったことが再現するにはいくつか条件がある。

- 購買単価の分布がロングテールになっていること
- ディスカウント条件がユーザーに伝わっていること
- **ユーザーが自身の購買単価を操作可能であること** ← これが一番重要

## まとめ

- 平均購買単価のヒストグラムを見て、ディスカウント条件を決定するといいよ
- ディスカウント条件はユーザーに伝わるように工夫するといいよ
- レポートの雛形は作っておくといいよ
- X, Yを操作する、ユーザーへの伝え方を変えるABテストをするといいよ
- ABテストができない環境でもヒストグラムのBinごとの平均購買率の変化を見るといいよ
- ユーザーが自身の購買単価を操作可能であることが重要だよ

## 余談：時限式クーポンについて

「ユーザーへの伝え方」の文脈で、時限式クーポンについて触れておく。

この記事で最初においた目的として「売上を伸ばしたい」というのがあった。

実は時限式クーポンは、ユーザーの意思決定を早める効果は期待されるのだがトータルの売上を伸ばす効果はあまり期待できない。なぜかというと明日買おうと思っていたものを今日買うようになったとしても、トータルの売上は変わらないからだ。

ただしクーポン使用率が高かったり、瞬間的な売上を伸ばす効果はあるためレポーティングではその実態を把握できることは少ない。わかりやすく今日の売り上げは伸びるから。

長期的にみて意味のあることかも意識しないといけないよね、と思ってる。

その他これについて個人的に思うことは以下の通り。

- 時間制限は短ければ短いほど効果がある
  - 効能としてはユーザーの意思決定を早める効果がある
  - 予算消化したいとき、KPI達成したいとか便利
  - 見せ方は派手などよい
- 1ヶ月とか1年とかの有効期限はなんなの？
  - 配る側は忘れることを期待してる
  - 事業会社が合法的に発行できる通貨であり、失効条件も握っているためクーポン使用率を操作したいときに便利
  - そのため見せ方も目立たない方がいい

## Source Code

User Class

```python
class User:
    def __init__(self, user_id):
        self.user_id = user_id
        self.max_purchase_amount = 10000

    def generate_purchase_amount(self):
        purchase_amount = np.random.pareto(a=2.0) * self.max_purchase_amount / 10
        purchase_amount = min(max(purchase_amount, 0), self.max_purchase_amount)
        return purchase_amount

    def apply_coupon(
        self,
        purchase_amount,
        coupon_threshold: float = 1000.0,
        discount_rate=0.2,
    ):
        if purchase_amount < coupon_threshold:
            probability = 1 - (coupon_threshold - purchase_amount) / coupon_threshold
            if np.random.rand() < probability:
                purchase_amount += coupon_threshold * discount_rate
        return purchase_amount
```

通常時の購入金額の分布

```python
num_users = 100000
users = [User(user_id=i) for i in range(num_users)]
purchase_amounts = [user.generate_purchase_amount() for user in users]

plt.hist(purchase_amounts, bins=100)
plt.xlabel('Purchase Amount (Yen)')
plt.ylabel('Number of Users')
plt.title('Distribution of Purchase Amounts')
plt.show()
```

クーポン適用後の購入金額の分布

```python
users = [User(user_id=i) for i in range(num_users)]
coupon_threshold = 1000

purchase_amounts = []
for user in users:
    amount = user.generate_purchase_amount()
    amount = user.apply_coupon(amount, coupon_threshold, discount_rate=0.2)
    purchase_amounts.append(amount)

plt.hist(purchase_amounts, bins=100)
plt.vlines(coupon_threshold * 0.95, 0, len(users) * 0.15, colors='r', linestyles='dashed', label="coupon threshold")
plt.xlabel('Purchase Amount (Yen)')
plt.ylabel('Number of Users')
plt.title('Distribution of Purchase Amounts with Coupon Applied')
plt.legend()
plt.show()
```

平均購買単価

```python
from typing import List
import numpy as np

def purchase_statistics(purchase_amounts: List[float]):
  average_amount = np.mean(purchase_amounts)
  total_amount = np.sum(purchase_amounts)
  users_between_1000_1500 = len([amount for amount in purchase_amounts if 1000 <= amount <= 1500])

  print(f"平均購買単価: {average_amount:.2f}")
  print(f"累計購買金額: {total_amount:.2f}")
```
