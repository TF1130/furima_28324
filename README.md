# テーブル設計

## users テーブル

| Column           | Type   | Option      |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| password         | string | null: false |
| password_confirm | string | null: false |
| identification   | string | null: false |

### Association

- has_many :items
- has_many :comments

## items テーブル

| Column  | Type   | Option      |
| ------- | ------ | ----------- |
| image   | url    | null: false |
| text    | string | null: false |
| user_id | string | null: false |

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