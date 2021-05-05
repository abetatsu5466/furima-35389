# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname     | string | null: false   |
| email        | string | unique: true   |null: false |
| encrypted_password | string | null: false   |
|first name  |         | string | null: false  |
｜last name  | string | null: false  |
| katakana first name     | string | null: false   |
| katakana last name     | string | null: false   |
｜birthday | date | null: false   |




### Association

- has_many :items
- has_many :Purchases
  has_many :delivery

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title         | string | null: false |
| details      | text | null: false|
|category_id       | integer| null:false
|status_id        | integer   |null:false |
｜costs_id        ｜integer| null: false  |
｜area_id          ｜integer｜null: false｜
|post_id          | integer| null:false|
|days_id          | integer | null: false|
| price         | text | integer | null: false
| user       | references  |  null: false,foreign_key: true|

### Association

- has_many :users
- has_many :Purchases
  has_many :delivery

## Purchases テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| item  | references |  null: false,foreign_key: true |
| user| references |  null: false,foreign_key: true |



  ## Association

  has_many :users
  has_may :items

  ## delivery テーブル


| Column | Type   | Options     |
| ------ | ------ | ----------- |
｜Postal code  ｜integer| not:false|
|phone number  |integer| not:false|
｜Shipping address | string | not:false|
|Purchases | references |  null: false,foreign_key: true |


## Association

- has_many :items
  has_many :users