# README

## usersテーブル

| Column           | Type    | Options                  |
| ---------------- | ------- | ------------------------ |
| nickname         | string  | null: false,             |
| email            | string  | null: false,unique: true |
| password         | string  | null: false              |
| last_name        | string  | null: false              |
| first_name       | string  | null: false              |
| last_name_kana   | string  | null: false              |
| first_name_kana  | string  | null: false              |
| year             | integer | null: false              |
| month            | integer | null: false              |
| day              | integer | null: false              |
### Association
has_many :items
has_one :orders


## itemsテーブル
| Column              | Type    | Options                        |
| ------------------- | ------- | ------------------------------ |
| image               | string  | null: false                    |
| product_name        | string  | null: false                    |
| product_description | text    | null: false                    |
| category            | string  | null: false                    |
| condition           | string  | null: false                    |
| origin_location     | string  | null: false                    |
| shipping_duration   | string  | null: false                    |
| user_id             | integer | null: false, foreign_key: true |
### Association
belongs_to :users
has_one :orders


## ordersテーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| user_id      | integer | null: false, foreign_key: true |
| items_id     | integer | null: false, foreign_key: true |
### Association
- belongs_to :users
- belongs_to :items
  has_one :adresses


## adressesテーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| purchase     | integer | null: false                    |
| postal_code  | string  | null: false                    |
| prefecture   | string  | null: false                    |
| city         | string  | null: false                    |
| adress_line1 | string  | null: false                    |
| adress_line2 | string  | ------------------------------ |
| phone_number | integer | null: false                    |
### Association
- belongs_to :orders