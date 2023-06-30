# README

## usersテーブル

| Column           | Type    | Options                  |
| ---------------- | ------- | ------------------------ |
| nickname         | string  | null: false              |
| email            | string  | null: false,unique: true |
| encrypt_password | string  | null: false              |
| last_name        | string  | null: false              |
| first_name       | string  | null: false              |
| last_name_kana   | string  | null: false              |
| first_name_kana  | string  | null: false              |
| birth_date       | date    | null: false              |
### Association
has_many :items
has_many :orders


## itemsテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| product_description | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| shipping_cost_id    | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| shipping_duration_id| integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |
### Association
belongs_to :user
has_one :order


## ordersテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
  has_one :address
  

## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address_line1 | string     | null: false                    |
| address_line2 | string     | ------------------------------ |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |
### Association
- belongs_to :order