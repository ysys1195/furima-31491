# usersテーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| password            | string  | null: false               |
| first_name          | string  | null: false               |
| last_name           | string  | null: false               |
| first_name_katakana | string  | null: false               |
| last_name_katakana  | string  | null: false               |
| birthday            | integer | null: false               |

## Association

- has_many :items
- has_many :purchases

# itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| detail        | string     | null: false                    |
| category      | string     | null: false                    |
| status        | string     | null: false                    |
| price         | integer    | null: false                    |
| delivery_fee  | integer    | null: false                    |
| delivery_days | integer    | null: false                    |
| delivery_from | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_one :purchase

# purchasesテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| card         | integer    | null: false                    |
| postal_code  | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| phone_number | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item