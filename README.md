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
--has_many : items
--has_many : orders


## Items Table
| Column             |Type        |Options                         |
|--------------------|------------|--------------------------------|
| item_category      | string     | null: false                    |
| item_status        | string     | null: false                    |
| fee_status         | string     | null: false                    |
| pretectur          | string     | null: false                    |
| shipping_days      | string     | null: false                    |
| item_price         | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
--belong_to : user
--has_one   : order


## Order Table
| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
--belong_to : user
--belong_to : item
--has_many  : order


## Addresses Table
| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| post_code          | string     | null: false                    |
| prefectur          | string     | null: false                    |
| city               | string     | null: false                    |
| street             | string     | null: false                    |
| building           | string     |                                |
| telephone_num      | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association
--belong_to :  order