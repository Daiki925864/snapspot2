# アプリケーション名
SnapSpot

# アプリケーション概要
画像と撮影場所を共有するためのアプリ。何気ない写真を共有し、他のユーザーとの交流を楽しむことができる。

# URL
https://snapspot2.onrender.com

# テスト用アカウント
- Basic認証ID：admin
- Basic認証パスワード：2222
- メールアドレス：taro@yahoo.co.jp
- パスワード：taro11

# 利用方法

## 画像投稿
1. トップページよりユーザー新規登録を行う
2. 新規投稿ボタンより画像と位置情報を入力し投稿する

## コメント投稿
1. トップページよりユーザー新規登録を行う ※投稿者はコメントできないので他のアカウントでログインする
2. 投稿詳細ページよりコメントを入力し投稿する

# アプリケーションを作成した背景
現在使用されているほとんどのSNSやアプリケーションには撮影場所を共有する機能が存在せず、<br>
投稿された画像の撮影場所を知ることはできなかった。<br>
そこで撮影場所の共有をメイン機能としたアプリケーションを作成した。

# 洗い出した要件
要件定義シート
https://docs.google.com/spreadsheets/d/1uJPm3l2JeFKdiujgGPQbzL8kdJOQnAzUE5CfSel4S_U/edit#gid=335129358

# 実装した機能についての画像やGIFおよびその説明
## トップページ
[![Image from Gyazo](https://i.gyazo.com/18b655b92f79b9384aa718260006d8b8.png)](https://gyazo.com/18b655b92f79b9384aa718260006d8b8)

## 位置情報登録機能
[![Image from Gyazo](https://i.gyazo.com/3e046d2b6e68f3d61869603da4d5d2c5.gif)](https://gyazo.com/3e046d2b6e68f3d61869603da4d5d2c5)
住所検索で撮影地を検索できる機能に加えて
住所検索に該当しない場所も登録できるようにするために<br>
マーカーの位置をドラッグ&ドロップで調整できるようにした。
# 実装予定の機能

# テーブル設計
[![Image from Gyazo](https://i.gyazo.com/5843c4003c41d150d2c0676b732cb4f4.jpg)](https://gyazo.com/5843c4003c41d150d2c0676b732cb4f4)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/bebf1914a664468981f52cd75d1bf757.png)](https://gyazo.com/bebf1914a664468981f52cd75d1bf757)

# 開発環境
- フロントエンド HTML CSS JavaScript Bootstrap
- バックエンド ruby  Ruby on Rails
- インフラ 
- テスト RSpec
- テキストエディタ VisualStudioCode
- タスク管理 GitHub

# ローカルでの動作方法
以下のコマンドを順に実行。
1. % git clone https://github.com/Daiki925864/snapspot2
2. % cd snapspot2
3. % bundle install
4. % yarn install

# 工夫したポイント
## 位置情報の登録
まず、住所検索により緯度経度情報を取得し登録する機能を実装した。<br>
しかし住所検索に該当しない場所を登録できないことに気づいた。<br>
そこで上の機能に加え、マーカーの位置をドラッグ&ドロップで調整できるようにし、その場所の緯度経度を取得する機能を追加した。<br>
これにより住所検索で該当しない場所も登録することが可能となった。

[![Image from Gyazo](https://i.gyazo.com/3e046d2b6e68f3d61869603da4d5d2c5.gif)](https://gyazo.com/3e046d2b6e68f3d61869603da4d5d2c5)

## 階層構造のカテゴリーの実装
Gem ancestryを導入し、階層構造のカテゴリーを実装した。
また、新規投稿画面、編集画面で逐次下階層のカテゴリーを自動で表示されるようにした。
## タグ付け機能に逐次検索機能を実装
新規投稿画面、編集画面でタグを入力する際に、DBに保存されているタグ情報を候補として自動的に検索が行われるようにした。