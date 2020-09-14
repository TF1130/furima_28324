# フリマアプリの模写サイトを作成致しました。
### https://furima-28324.herokuapp.com/
## 機能一覧
### ・ユーザー管理
#### ユーザー新規登録によりユーザー情報が保存されます。新規登録を行ったユーザーはログインする事が可能になります。
### ・商品一覧表示 
#### トップページの画面中央のピックアップカテゴリー欄に、投稿した出品物が一覧表示されます。
### ・商品詳細表示 
#### 一覧表示欄の商品画像をクリックすると、詳細ページに遷移します。クリックした商品の出品者以外のログインユーザーが購入ボタンをクリックすると購入ページに遷移します。
### ・商品出品 
#### 商品を出品する為には画面右下の出品するボタンをクリックすると新規投稿商品画面に遷移します。
### ・商品削除 
#### 商品の出品者は商品画面ページの削除ボタンから商品情報の削除を行う事が可能です。
### ・商品購入 
#### 商品詳細ページの購入ボタンから購入ページに遷移し、購入情報を入力した後購入するボタンをクリックすると購入完了となります。PAYJPのテストカードを利用して決済のテストが行えます。
### ・basic認証「admin」「2222」 
## ここからは追加実装部分になります。
### ・画像のプレビュー表示
### ・AWSのEC2仮想環境へアプリをクローンして、自動デプロイ化
### ・画像をAWSのS3へ保存する

## 機能説明
#### Basic認証が求められている際は「admin」「2222」にて認証を行ってください。
### サイト上部から順に実装している機能について説明します。
### 左上のロゴ「FURIMA」からトップページリンクへと遷移します。
### ヘッダー右部 ログイン 新規登録 からログインと新規登録を行う事ができます。テスト用のアカウントが作成済みとなっていますので、機能確認の際はお手数ですがログインをお願い致します。
### 出品者用
メールアドレス名: test100@test.co.jp
パスワード: test10

### 購入者用
メールアドレス: test999@test.co.jp
パスワード: test999
### ログインユーザーは商品の出品と購入を行う事が可能です。 出品する為には画面右下の出品するボタンをクリックすると新規投稿商品画面に遷移します。また、ピックアップカテゴリーの商品一覧の新規投稿商品からも出品画面に遷移する事が可能です。
### 出品画面では必須項目を入力して、商品画像をアップロードする事で出品を行う事が可能です。画像投稿実装にはActiveStorageを導入しました。
### 【追加実装】画像投稿機能に付随して、JavaScriptによる画像のプレビュー機能の実装を行いました。選択した画像のプレビュー表示がされると共に、別の画像を選択して表示した際にプレビューが更新されるように実装しました。
### 購入画面ではPAYJPを導入しました。テストカードにて決済のテストを行う事が可能です。
#### 購入用カード情報
番号：4242424242424242
期限：Mon Mar 23 2020 00:00:00 GMT+0900 (日本標準時)
セキュリティコード：123

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
- has_many :orders

## items テーブル

| Column  | Type    | Option                         |
| ------- | ------- | ------------------------------ |
| title   | string  | null: false                    |
| image   | url     | null: false                    |
| price   | integer | null: false                    |
| text    | text    | null: false                    |
| user_id | string  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order
- has_many   :comments


## comments テーブル

| Column  | Type   | Option                         |
| ------- | ------ | ------------------------------ |
| text    | string | null: false                    |
| user_id | string | null: false, foreign_key: true |
| item_id | string | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## orders テーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :location

## locationテーブル

| Column        | Type       | Option                        |
| ------------- | ---------- | ----------------------------- |
| postcode      | string     | null: false                   |
| prefecture_id | integer    | null: false                   |
| city          | string     | null: false                   |
| block         | string     | null: false                   |
| building      | string     |                               |
| phone_number  | string     | null: false                   |
| order         | references | null: false, foreign_key:true |

### Association

- belongs_to :order
