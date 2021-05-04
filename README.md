# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | not: null   |
| email    | string | not: null   |
| password | string | not: null   |
| profile  | text   | not: null   |
| |   | |
| |   | |

### Association

- has_many :items
- has_many :Purchases

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title   | string | not: null |
| price | text | not: null |
| details | text | not: null|
| image| ActiveStorage | ---------------------------|
|  | | |

### Association

- belongs_to :users
- has_many :Purchases

## Purchases テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| Purchase price  | string | not: null |
| Sale amount| text | not: null |
|  || |


  ## Association

  belongs_to :users
  has_one :items