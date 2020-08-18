# テーブル設計

## users テーブル

| Column           | Type   | Option      |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| password         | string | null: false |
| password_confirm | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| date_select      | date   | null: false |
| email            | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :transaction

## items テーブル

| Column            | Type   | Option      |
| ----------------- | ------ | ----------- |
| title             | string | null: false |
| image             | url    | null: false |
| price             | string | null: false |
| text              | text   | null: false |
| user_id           | string | null: false |
| item_id           | string | null: false |
| category          | string | null: false |
| item_status       | string | null: false |
| delivery_fee      | string | null: false |
| ShipCity          | string | null: false |
| ShipDate_Standard | string | null: false |

### Association

- belongs_to :user
- belongs_to :transaction
- has_many :comments


## comments テーブル

| Column | Type   | Option      |
| ------ | ------ | ----------- |
| text   | string | null: false |

### Association

- belongs_to :user
- belongs_to :item

## transaction テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## addressテーブル

| Column        | Type    | Option      |
| ------------- | ------- | ----------- |
| postcode      | string  | null: false |
| prefecture_id | integer | null: false |
| city          | string  | null: false |
| block         | string  | null: false |
| building      | string  | null: false |
| phone_number  | string  | null: false |

### Association

- belongs_to :transaction
