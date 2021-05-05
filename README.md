# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname     | string | null: false   |
| email        | string | unique: true,null: false |
| encrypted_password | string | null: false   |
|first_name  | string | null: false  |
｜last_name  | string | null: false  |
| katakana_first_name     | string | null: false   |
| katakana_last_name     | string | null: false   |
｜birthday | date | null: false   |




### Association

- has_many :items
- has_many :purchases
  

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title         | string | null: false |
| details      | text | null: false|
|category_id       | integer| null:false
|status_id        | integer   |null:false |
|costs_id        ｜integer| null: false  |
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
  has_one :delivery

  ## deliverys テーブル


| Column | Type   | Options     |
| ------ | ------ | ----------- |
|postal_code     ｜ string | null:false|
|address         |string | null:false|
|house number | string | null:false|
|building_name   | string | |
|phone_number    | string | null:false|
|post_id          | integer| null:false|
|purchases   |references  |  null: false|

## Association

  belongs_to :purchase