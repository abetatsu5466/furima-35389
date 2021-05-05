# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname     | string | not: null   |
| email        | string | unique: true   |not: null |
| encrypted_password | string | not: null   |
| profile       | text   | not: null   |
| name|         | string | not: null   |
| Katakana      | string | not: null   |





### Association

- has_many :items
- has_many :Purchases
  has_many :delivery

## items テーブル

| Column | Type   | Options     |

| title         | string | not: null |
| Description   | text | not:null |
| details      | text | not: null|
|Category       | text| not:null
|Status        | text   |not:null   |
｜costs        ｜integer| not: null   |
｜area          ｜text｜not: null｜
|post           | text| null|
|days          | text  | null  |
| price         | text | integer |
｜Profit        | text | integer |
| user_id       | references  | not: null |

### Association

- has_many :users
- has_many :Purchases
  has_many :delivery

## Purchases テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| item_id  | references | not: null |
| user_id| references | not: null |
|  || |


  ## Association

  has_many :users
  has_may :items

  ## delivery テーブル

|user_id｜references｜not: null｜
|items| references|not: null|

## Association

- has_many :items
  has_many :users