# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null,false|
|id|integer|null: false,|
|email|string|null: false, unique: true|
|passward|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_furigana|string|null:false|
|first_furigana|string|null:false|
|birth_day|date|null:false|


### Association
- has_many :products
- has_one :credit_card
- has_many :likes
- has_many :comments
- has_many :contact_purchases
- has_many :contact_troubles
- has_many :contact_reports
- has_many :contacts
- has_many :contact_withdrawals
- has_one :phone_number_authorizations
- has_one :delivary_address

## phone_number_authorizationsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false,|
|telephon|string|null:false, unique:true|

### Association
- belongs_to :user

## delivary_addressテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null,false|
|postal_code|integer|null:false|
|prefeture|string|null:false|
|city|string|null:false|
|block|string|null:false|
|building|string|null:false|

### Association
- belongs_to :user

## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|integer|null:false|
|mouth_period|integer|null:false|
|year_period|integer|null:false|
|sevurity_code|integer|null:false|

### Association
- belongs_to :user

## banks_accountsテーブル

|Column|Type|Options|
|------|----|-------|
|bank_name|integer|null:false|
|account_type|string|null:false|
|branch_code|integer|null:false|
|account_number|integer|null:false|
|family_name|string|null:false|
|first_name|string|null:false|


### Association
- belongs_to :user


## productsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|name|string|null: false|
|size|string|
|status|integer|null: false|
|shipping_fee|boolean|null: false|
|shipping_method|string|null: false|
|ship_from|string|null: false|
|shipping_date|string|null: false|
|price|integer|null: false|
|brand|string|
|current_status|string|null: false|


### Association
- has_many :categories
- has_many :likes
- has_many :comments
- belongs_to :user
- belongs_to :purchase


## categoryテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false|
|name|string|null: false|
|big_id|integer||
|middle_id|integer||

### Association
- belongs_to :product


## purchasesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|product_id|integer|null: false|
|evaluation|integer|null: false|

### Association
- has_many :contact_troubles
- has_many :contact_purchases
- belongs_to :user
- belongs_to :product

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false|
|product_id|integer|null:false|
|text|text|null:false|


### Association
- belongs_to : user
- belongs_to : product

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false|
|product_id|integer|null:false|
|like|integer|null:false|
|bad|integer|null:false|

### Association
- belongs_to: user
- belongs_to: product


## contact_troublesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false|
|user_id|boolean|
|purchase_id|integer|null:false|
|text|string|null:false|

### Association
- belongs_to :user


## contact_purchasesテーブル

|Column|Type|Options|
|------|----|-------|
|type|string| |
|user_id|integer|null:false|
|purchase_id|integer| |
|text|string|null:false|

### Association
- belongs_to :user

## contact_reportsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false|
|occurrence_date|date|null:false|
|frequency|string|null:false|
|detailed_status|text|null:false|
|relation_product|string| |
|text|text| |

### Association
- belongs_to :user

## contactsテーブル

|Column|Type|Options|
|------|----|-------|
|type|string| |
|user_id|integer|null:false|
|text|text|null:false|

### Association
- belongs_to :user


## contact_withdrawalsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false|
|withdrawals_reason|text| |
|detailed|text| |
|check_box|boolean|null:false|

### Association
- belongs_to :user

