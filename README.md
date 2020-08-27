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
- has_many :goods
- has_many :orders

## goods テーブル

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
- belongs_to :users
- has_one :addresses
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

### Association
- belongs_to :goods

## orders テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| user_id      | integer | null: false |
| goods_id     | integer | null: false |
| addresses_id | integer | null: false |

### Association
- belongs_to :goods
- belongs_to :user

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
