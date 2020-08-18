# テーブル設計

## users テーブル

| Column           | Type   | Option      |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| password         | string | null: false |
| password_confirm | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| date_select      | string | null: false |
| email            | string | null: false |

### Association

- has_many :items
- has_many :comments

## items テーブル

| Column  | Type   | Option      |
| ------- | ------ | ----------- |
| image   | url    | null: false |
| text    | string | null: false |
| user_id | string | null: false |
| item_id | string | null: false |

### Association

- belongs_to :user
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
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- has_one :user
- belongs_to :item
