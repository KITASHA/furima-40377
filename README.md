## Users Table

|Column      |Type       |Options                    |
| name       | string    |null: false                |
| pass_word  | string    |null: false                |
| email      | string    |null: false, unique: true  |

### Association
--has_many : items
--has_many : orders


## Items Table

|Column        |Type        |Options                         |
| product_name | string     | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true | 

### Association
--belong_to : user
--has_one : order


## Order Table

|Column        |Type        |Options                         |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association
--belong_to : user
--belong_to : item
--has_one : order


## Addresses Table

|Column        |Type        |Options                         |
| prefectur    | string     | null: false                    |
| city         | string     | null: false                    |
| street       | string     | null: false                    | 
| post_code    | integer    | null: false                    |
| order        | references | null: false, foreign_key: true |

### Association
--belong_to :  order