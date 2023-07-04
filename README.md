# アプリケーション名
Snap Spot

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

# 洗い出した要件
要件定義シート
https://docs.google.com/spreadsheets/d/1uJPm3l2JeFKdiujgGPQbzL8kdJOQnAzUE5CfSel4S_U/edit#gid=335129358

# 実装した機能についての画像やGIFおよびその説明
## トップページ
[![Image from Gyazo](https://i.gyazo.com/18b655b92f79b9384aa718260006d8b8.png)](https://gyazo.com/18b655b92f79b9384aa718260006d8b8)

## 位置情報登録機能
[![Image from Gyazo](https://i.gyazo.com/3e046d2b6e68f3d61869603da4d5d2c5.gif)](https://gyazo.com/3e046d2b6e68f3d61869603da4d5d2c5)
住所検索に該当しない場所も登録できるようにするために、
マーカーの位置をドラッグ&ドロップで調整できるようにした。
# 実装予定の機能

# テーブル設計
[![Image from Gyazo](https://i.gyazo.com/73d4cba53597b3b1d8a37b7d63eaceef.png)](https://gyazo.com/73d4cba53597b3b1d8a37b7d63eaceef)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/b10e2a60fbfbe392260e2746a009d977.png)](https://gyazo.com/b10e2a60fbfbe392260e2746a009d977)

# 開発環境
- フロントエンド HTML CSS Bootstrap
- バックエンド ruby Ruby on Rails
- インフラ 
- テスト RSpec
- テキストエディタ Visual Studio Code
- タスク管理 GitHub

# ローカルでの動作方法
以下のコマンドを順に実行。
1. % git clone https://github.com/Daiki925864/snapspot2
2. % cd snapspot2
3. % bundle install
4. % yarn install

# 工夫したポイント
## 位置情報の登録
まず、住所検索により緯度経度情報を取得し登録する機能を実装した。
しかし住所検索に該当しない場所を登録できないことに気づいた。
そこで上の機能に加え、マーカーの位置をドラッグ&ドロップで調整できるようにし、その場所の緯度経度を取得する機能を追加した。

[![Image from Gyazo](https://i.gyazo.com/3e046d2b6e68f3d61869603da4d5d2c5.gif)](https://gyazo.com/3e046d2b6e68f3d61869603da4d5d2c5)