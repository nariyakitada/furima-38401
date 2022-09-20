## users テーブル

| Column                   | Type   | Options                   |
| ------------------------ | ------ | ------------------------- |
| nick_name                | string | null: false               |
| email                    | string | null: false, unique: true |
| encrypted_password       | string | null: false               |
| first_name               | string | null: false               |
| last_name                | string | null: false               |
| first_name2              | string | null: false               |
| last_name2               | string | null: false               |
| birthday                 | date   | null: false               |

### Association

- has_many :products
- has_many :records



## products テーブル

| Column       | Type         | Options                        |
| ------------ | ------------ | ------------------------------ |
| item_name    | string       | null: false                    |
| explanation  | string       | null: false                    |
| category_id  | integer      | null: false                    |
| situation_id | integer      | null: false                    |
| delivery_id  | integer      | null: false                    |
| area_id      | integer      | null: false                    |
| day_id       | integer      | null: false                    |
| price        | integer      | null: false                    |
| user         | references   | null: false, foreign_key: true |

### Association

- has_one :record
- belongs_to :user



## records テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| product     | references | null: false, foreign_key: true |

### Association

- has_one :address
- belongs_to :user
- belongs_to :product


## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| area_id         | integer    | null: false                    |
| municipalities  | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| record          | references | null: false, foreign_key: true |

### Association

- belongs_to :record