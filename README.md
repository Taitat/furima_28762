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
- has_many :order



## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| name                | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| postage_payer_id    | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| handling_time_id    | integer    | null: false                    |
| price               | integer    | null: false                    |

### Association

- belongs_to :user
- has_one_attached :image
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :handling_time
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :prefecture



## images テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| image               | string     | null: false                    |
| item                | references | null: false, foreign_key: true |

### Association

- belongs_to :items



## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |
| price               | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## addresses テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| post_code           | string     | null: false                    |
| prefectures_id      | integer    | null: false, foreign_key: true |
| city                | string     | null: false                    |
| address_line        | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false, uniqueness: true  |
| order               | references | null: false, foreign_key: true |

### Association

- belongs_to :order
- belongs_to_active_hash :prefecture



### active_hash

- category
- condition
- handling_time
- postage_payer
- prefecture

