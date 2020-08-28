# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| user            | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| nickname        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | date   | null: false |

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
- has_one :order #もともとorderとのアソシエーションはこちらに記述していますが間違るようでしたら教えて頂きたいです。

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
- belongs_to :item

## orders テーブル

| Column        | Type    | Options                       |
| ------------- | ------- | ----------------------------- |
| user_id       | integer | null: false, foreign_key.true |
| items_id      | integer | null: false, foreign_key.true |

### Association
- belongs_to :item
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
