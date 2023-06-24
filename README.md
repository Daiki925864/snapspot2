# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |

### Association

- has_many :posts
- has_many :comments

## posts テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| tittle           | string     | null: false                    |
| content          | text       | null: false                    |
| shooting_date    | date       | null: false                    |
撮影位置情報のカラム
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| content          | text       | null: false                    |
| user             | references | null: false, foreign_key: true |
| post             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post