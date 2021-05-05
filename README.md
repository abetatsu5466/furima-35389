# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname     | string | null: false   |
| email        | string | unique: true   |null: false |
| encrypted_password | string | null: false   |
|first_name  |         | string | null: false  |
｜last_name  | string | null: false  |
| katakana_first_name     | string | null: false   |
| katakana_last_name     | string | null: false   |
｜birthday | date | null: false   |




### Association

- has_many :items
- has_many :Purchases
  

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
| price          | integer | null: false
| user       | references  |  null: false,foreign_key: true|

### Association

- belongs_to :user
- has_one :purchase
  

## Purchases テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| item  | references |  null: false,foreign_key: true |
| user| references |  null: false,foreign_key: true |



  ## Association

  belongs_to :user
  belongs_to :item
  belongs_to :delivery

  ## delivery テーブル


| Column | Type   | Options     |
| ------ | ------ | ----------- |
｜Postal code    ｜ string | not:false|
|Street address | string | not:false|
｜Prefectures |   string | not:false|
|Municipality   | string | not:false|
|address        |string | not:false|
|Building name | string | not:false|
|phone number  | string | not:false|
｜Shipping address | string | not:false|
｜phone number |  string | not:false|
|Purchases | references | not:false |

## Association

  has_one :purchase