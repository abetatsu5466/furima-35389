# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname     | string | not: false   |
| email        | string | unique: true   |not: false |
| encrypted_password | string | not: false   |
|first name  |         | string | not: false  |
｜last name  | string | not: false  |
| katakana first name     | string | not: false   |
| katakana last name     | string | not: false   |
｜birthday_id | integer | not: false   |




### Association

- has_many :items
- has_many :Purchases
  has_many :delivery

## items テーブル

| Column | Type   | Options     |

| title         | string | not: false |
| Description   | text | not:false |
| details      | text | not: false|
|Category_id       | integer| not:false
|Status_id        | integer   |not:false |
｜costs_id        ｜integer| not: false  |
｜area_id          ｜integer｜not: false｜
|post_id          | integer| not:false|
|days_id          | integer | not: false|
| price         | text | integer | not: false
｜Profit        | text | integer | not: false
| user       | references  |  not: false,foreign_key: true|

### Association

- has_many :users
- has_many :Purchases
  has_many :delivery

## Purchases テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| item  | references |  not: false,foreign_key: true |
| user| references |  not: false,foreign_key: true |



  ## Association

  has_many :users
  has_may :items

  ## delivery テーブル

｜Shipping address | string | not:false|
|user   ｜references｜ not: false,foreign_key: true｜
|items   | references| not: false,foreign_key: true|

## Association

- has_many :items
  has_many :users