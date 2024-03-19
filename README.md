## Users Table
| Column             | Type       | Options                       |
|--------------------|------------|-------------------------------|
| nickname           | string     | null: false                   |
| email              | string     | null: false, unique: true     |
| encrypted_password | string     | null: false                   |
| last_name          | string     | null: false                   |
| first_name         | string     | null: false                   |
| last_name_kana     | string     | null: false                   |
| first_name_kana    | string     | null: false                   |
| birthday           | date       | null: false                   |

### Association
--has_many :items
--has_many :orders


## Items Table
| Column             |Type        |Options                         |
|--------------------|------------|--------------------------------|
| item_name          | string     | null: false                    |
| item_info          | text       | null: false                    |
| item_category_id   | integer    | null: false                    |
| item_status_id     | integer    | null: false                    |
| fee_status_id      | integer    | null: false                    |
| pretectur_id       | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| item_price         | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
--belongs_to :user
--has_one :order


## Orders Table
| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
--belongs_to :user
--belongs_to :item
--has_one :order


## Addresses Table
| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| post_code          | string     | null: false                    |
| pretectur_id       | integer    | null: false                    |
| city               | string     | null: false                    |
| street             | string     | null: false                    |
| building           | string     |                                |
| telephone_num      | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association
--belongs_to :order