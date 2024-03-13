## Users Table
| Column             | Type       | Options                       |
| nickname           | string     | null: false                   |
| email              | string     | null: false, unique: true     |
| encrypted_password | string     | null: false                   |
| last_name          | string     | null: false                   |
| first_name         | string     | null: false                   |
| last_name_kana     | string     | null: false                   |
| first_name_kana    | string     | null: false                   |
| birth_year         | integer    | null: false                   |
| birth_month        | integer    | null: false                   |
| birth_day          | integer    | null: false                   |

### Association
--has_many : items
--has_many : orders


## Items Table
| Column             |Type        |Options                         |
| product_name       | string     | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
--belong_to : user
--has_one : order


## Order Table
| Column             | Type       | Options                        |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
--belong_to : user
--belong_to : item
--has_one : order


## Addresses Table
| Column             | Type       | Options                        |
| post_code          | integer    | null: false                    |
| prefectur          | string     | null: false                    |
| city               | string     | null: false                    |
| street             | string     | null: false                    |
| building           | string     | null: false                    |
| telephone_num      | integer    | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association
--belong_to :  order