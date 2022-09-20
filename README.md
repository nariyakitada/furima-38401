## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :products
- has_many :records



## products テーブル

| Column      | Type         | Options                        |
| ----------- | ------------ | ------------------------------ |
| image       | string       | null: false                    |
| item_name   | string       | null: false                    |
| explanation | string       | null: false                    |
| category    | string       | null: false                    |
| situation   | string       | null: false                    |
| area        | string       | null: false                    |
| days        | string       | null: false                    |
| price       | string       | null: false                    |
| user_id     | references   | null: false, foreign_key: true |

### Association

- has_one :records
- belongs_to :users



## records テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user_id     | references | null: false, foreign_key: true |
| products_id | references | null: false, foreign_key: true |

### Association

- has_one :addresses
- belongs_to :users
- belongs_to :products


## addresses テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| post_code      | string | null: false |
| prefectures    | string | null: false |
| municipalities | string | null: false |
| address        | string | null: false |
| building_name  | string |             |
| phone_number   | string | null: false |

### Association

- belongs_to :records