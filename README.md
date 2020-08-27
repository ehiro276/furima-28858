# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| user       | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| nickname   | string | null: false |
| firstname  | string | null: false |
| lastname   | string | null: false |
| firstname2 | string | null: false |
| lastname2  | string | null: false |
| birthday   | date   | null: false |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| name         | string  | null: false |
| info         | text    | null: false |
| category_id  | integer | null: false |
| condition_id | integer | null: false |
| cost_id      | integer | null: false |
| area_id      | integer | null: false |
| sendout_id   | integer | null: false |
| price        | integer | null: false |

### Association
- belongs_to :user
- has_one :address
- has_one :order

## addresses テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| postcode         | string  | null: false |
| prefecture_id    | integer | null: false |
| city             | string  | null: false |
| number           | string  | null: false |
| building         | string  |             |
| telephone_number | string  | null: false |
| orders_id        | integer | null: false |

### Association
- belongs_to :item
- belongs_to :order

## orders テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| user_id       | integer | null: false |
| items_id      | integer | null: false |
| addressese_id | integer | null: false |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address

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
