## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true|
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_kana          | string  | null: false |
| first_kana         | string  | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |


## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| title              | string     | null: false |
| product_contents   | text       | null: false |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| shipping_method    | integer    | null: false |
| ship_from          | integer    | null: false |
| delivery_time      | integer    | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |


## orders テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| user       | references | null: false |
| item       | references | null: false |


## addresses テーブル

| Column       | Type       | Options     |
| ----------   | ---------- | ----------- |
| postal_code  | string     | null: false |
| prefecture   | string     | null: false |
| city         | string     | null: false |
| house_number | string     | null: false |
| building_name| string     |             |
| phone_number | string     | null: false |
| order        | references | null: false, foreign_key:true |

