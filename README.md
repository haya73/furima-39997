## users

|Column               |Type     |Options                     |
|email                |string   |null: false, unique: true   |
|nickname             |string   |null: false                 |
|encrypted_password   |string   |null: false                 |
|first_name           |string   |null: false                 |
|last_name            |string   |null: false                 |
|first_name_kana      |string   |null: false                 |
|last_name_kana       |string   |null: false                 |
|birthday             |date     |null: false                 |

### Association
has_many :items
has_many :orders



## items

|Column               |Type         |Options                         |
|item_name            |string       |null: false                     |
|description          |text         |null: false                     |
|category_id          |integer      |null: false                     |
|condition_id         |integer      |null: false                     |
|delivery_cost_id     |integer      |null: false                     |
|prefecture_id        |integer      |null: false                     |
|delivery_day_id      |integer      |null: false                     |
|price                |integer      |null: false                     |
|user                 |references   |null: false, foreign_key: true  |

### Association
belongs_to :user
has_one    :order


## orders

|Column               |Type         |Options                         |
|user                 |references   |null: false, foreign_key: true  |
|item                 |references   |null: false, foreign_key: true  |

### Association
belongs_to :user
has_one    :address
belongs_to :item



## addresses

|Column               |Type         |Options                        |
|post_code            |string       |null: false                    |
|prefecture_id        |integer      |null: false                    |
|city                 |string       |null: false                    |
|address              |string       |null: false                    |
|building             |string       |                               |
|telephone_number     |string       |null: false                    |
|order                |references   |null: false, foreign_key: true |

### Association
belongs_to :order