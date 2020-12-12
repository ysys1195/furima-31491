## usersテーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| first_name          | string  | null: false               |
| last_name           | string  | null: false               |
| first_name_katakana | string  | null: false               |
| last_name_katakana  | string  | null: false               |
| birthday            | date    | null: false               |

### Association

- has_many :items
- has_many :purchase_logs

## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| detail           | string     | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| price            | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| delivery_days_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_log

## purchase_logsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :purchase

## purchasesテーブル

| Column        | Type   | Options                        |
| ------------- | ------ | ------------------------------ |
| postal_code   | string | null: false                    |
| prefecture_id | string | null: false                    |
| city          | string | null: false                    |
| address       | string | null: false                    |
| phone_number  | string | null: false                    |

### Association

- has_one :purchase_log