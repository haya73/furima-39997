## users

|Column               |Type     |Options        |
|email                |string   |null: false    |
|encrypted_password   |string   |null: false    |
|name                 |string   |null: false    |
|profile              |text     |null: false    |
|nickname             |string   |null: false    |


### Association
has_many :items
has_many :comments 
has_many :order history

## items

|Column               |Type     |Options        |
|item_name            |string   |null: false    |
|condition            |string   |null: false    |
|explanation          |text     |null: false    |
|price                |string   |null: false    |


### Association
belongs_to :users

## comments 

|Column               |Type     |Options        |
|content              |text     |null: false    |
|item                 |string   |null: false    |
|user                 |string   |null: false    |


### Association
belongs_to :users

## order history

|Column               |Type     |Options        |
|buy                  |text     |null: false    |

### Association
belongs_to :users

## shipping address

|Column               |Type     |Options        |
|address              |string   |null: false    |
|post_code            |string   |null: false    |
|name                 |string   |null: false    |
|telephone_number     |string   |null: false    |

### Association
has_one :items