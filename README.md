## usersテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| nickname             | string     | null: false                    |
| email                | string     | null: false, unique: true      |
| encrypted_password   | string     | null: false                    |
| last_name            | string     | null: false                    |
| first_name           | string     | null: false                    |
| last_name_kana       | string     | null: false                    |
| first_name_kana      | string     | null: false                    |
| birthday             | date       | null: false                    |

### Association
- has_many :items
- has_many :purchases


## itemsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| shipping_fee_id     | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| preparation_day_id  | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## ordersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :shipping


## shippingsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| post_code            | string     | null: false                    |
| prefecture_id        | integer    | null: false                    |
| municipality         | string     | null: false                    |
| house_number         | string     | null: false                    |
| building_name        | string     |                                |
| phone_number         | string     | null: false                    |
| order                | references | null: false, foreign_key: true |

### Association
- belongs_to :order