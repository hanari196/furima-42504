## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false |
| name               | string | null: false |
| nickname           | string | null: false |
| profile            | text   | null: false |

## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| title              | string     | null: false |
| category           | integer    | null: false |
| condition          | integer    | null: false |
| Shipping method    | string     | null: false |
| price              | integer    | null: false |


## orders テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| user_id    | bigint     | null: false |
| item_id    | bigint     | null: false |

## addresses テーブル

| Column       | Type       | Options     |
| ----------   | ---------- | ----------- |
| postal_code  | integer    | null: false |
| prefecture   | string     | null: false |
| city         | string     | null: false |
| house_number | integer    | null: false |
| building_name| string     |             |
| room_number  | integer    |             |