# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## users テーブル

| Column          | Type   | Options                       |
| ----------------| ------ | ----------------------------- |
| nickname        | string | null: false,                  |
| email           | string | null: false, uniqueness: true |
| password        | string | null: false, uniqueness: true |
| last_name       | string | null: false                   |
| first_name      | string | null: false                   |
| last_name_kana  | string | null: false                   |
| first_name_kana | string | null: false                   |
| birth_date      | date   | null: false                   |

### Association

- has_many :items
- has_one :purchase



## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user_id             | references | null: false, foreign_key: true |
| item_name           | string     | null: false                    |
| item_description    | text       | null: false                    |
| images_id           | references | null: false, foreign_key: true |
| categories_id        | references | null: false, foreign_key: true |
| conditions_id       | references | null: false, foreign_key: true |
| postage_payers_id   | references | null: false, foreign_key: true |
| prefecture_id       | references | null: false, foreign_key: true |
| handling_times_id   | references | null: false, foreign_key: true |
| price               | integer    | null: false                    |
| sales_status        | boolean    | null: false                    |

### Association

- belongs_to :user
- has_many :images
- has_one :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :handling_time
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :prefecture



## images テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| image               | text       | null: false                    |
| items_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :items



## purchases テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| credit_card_number  | string     | null: false, uniqueness: true  |
| credit_card_year    | integer    | null: false                    |
| credit_card_month   | integer    | null: false                    |
| credit_card_cvc     | integer    | null: false                    |
| items_id            | references | null: false, foreign_key: true |
| users_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## addresses テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| post_code           | string     | null: false                    |
| prefectures_id      | references | null: false, foreign_key: true |
| city                | string     | null: false                    |
| building_name       | string     | null: false                    |
| phone_number        | string     | null: false, uniqueness: true  |
| purchases_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
- belongs_to_active_hash :prefecture



### active_hash

- category
- condition
- handling_time
- postage_payer
- prefecture

