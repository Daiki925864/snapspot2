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
[![Image from Gyazo](https://i.gyazo.com/117c36fecd86cdcbd82c31b3da5d3b97.png)](https://gyazo.com/117c36fecd86cdcbd82c31b3da5d3b97)

## 位置情報登録機能
[![Image from Gyazo](https://i.gyazo.com/9660a25617608efac0e28ae6e37b2843.gif)](https://gyazo.com/9660a25617608efac0e28ae6e37b2843)
地図中央にマーカーを落としその場所の緯度経度を取得する機能を実装した。
住所検索に該当しない場所も登録できる。
# 実装予定の機能

# テーブル設計
[![Image from Gyazo](https://i.gyazo.com/827a704e46b32db6c0e530e58d5ecf44.png)](https://gyazo.com/827a704e46b32db6c0e530e58d5ecf44)

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
そこで上の機能に加え、地図中央にマーカーを落としその場所の緯度経度を取得する機能を追加した。

[![Image from Gyazo](https://i.gyazo.com/9660a25617608efac0e28ae6e37b2843.gif)](https://gyazo.com/9660a25617608efac0e28ae6e37b2843)