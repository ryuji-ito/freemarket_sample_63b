# README
This README would normally document whatever steps are necessary to get the
application up and running.
Things you may want to cover:
* Ruby version
* System dependencies
* Configuration
* Database creation
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|passward|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|tel|string|null: false|
|profile|text| |
### Association
- has_many :cards, dependent: :destroy
- has_many :bought_products, foreign_key: 'buyer_id', class_name: 'Products' , dependent: :destroy,
- has_many :selling_products, -> { where("buyer_id is NULL") }, foreign_key: 'seller_id, class_name: 'Product', dependent: :destroy
- has_many :sold_products, -> { where("buyer_id is not NULL") }, foreign_key: 'seller_id', class_name: 'Products', dependent: :destroy
- has_many :comments, dependent: :destroy
- has_one :address, dependent: :destroy
- has_many :evaluations
- has_many :likes, dependent: :destroy
- has_many :liked_products, through: :likes, source: :products

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|string|null: false|
|categry_id|integer|null: false, foreign_key: true|
|clothes_size_id|integer|null: false if category.clothes_size_flg?, foreign_key: true|
|shoes_size_id|integer|null: false if category.shoes_size_flg?, foreign_key: true|
|brand_id|integer|foreign_key: true|
|product_condition|enum|null: false|
|shipping_payer_method_id|integer|null: false, foreign_key: true|
|prefecture_id|integer|null: false|
|days_of_shipping|enum|null: false|
|price|integer|null: false|
|seller_id|references|null: false, foreign_key: {to_table: :users}|
|buyer_id|references|foreign_key: {to_table: :users}|
|trade_status|enum|null: false, default: '出品中'|
### Association
belongs_to :seller, class_name: 'User'
belongs_to :buyer, class_name: 'User'
belongs_to :category
belongs_to :brand
belongs_to :shipping_payer_methods
belongs_to_active_hash :shoes_size
belongs_to_active_hash :clothes_size
belongs_to_active_hash :prefecture
has_many :images, dependent: :destroy
has_many :comments, dependent: :destroy
has_many :evaluations, dependent: :destroy
has_many :likes, dependent: :destroy
has_many :liked_users, through: likes, source: :user

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null:false|
|product_id|integer|null: false, foreign_key: true|
### Association
belongs_to :product

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
belongs_to :product
belongs_to :user
validates_uniqueness_of :product_id, scope: :user_id

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
belongs_to :user
belongs_to :product

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postal_code|char(7)|null: false|
|prefecture_id|integer|null: false, foreign_key: true|
|municipality|string|null: false|
|house_number|string|null: false|
|building_name|string| |
|tel|string| |
|user_id|integer|null: false, foreign_key: true|
### Association
belongs_to :user
belongs_to_active_hash :prefecture

## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|evaluation|enum|null: false|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
belongs_to :user
belongs_to :product

## categoriesテーブル (gem 'ancestry'を使う)
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|integer| |
|clothes_size_flg|boolean|default: false, null: false|
|shoes_size_flg|boolean|default: false, null: false|
|brand_flg|boolean|default: false, null: false|
### Association
has_many :products

## shipping_payer_methodsテーブル (gem 'ancestry'を使う)
|Column|Type|Options|
|------|----|-------|
|payer_or_method|string|null: false|
|ancestry|integer| |
### Association
has_many :products

## clothes_sizesテーブル (gem 'active_hash'を使用してDBには保存しない)
|Column|Type|Options|
|------|----|-------|
|name|string| |
### Association
has_many :products

## shoes_sizesテーブル (gem 'active_hash'を使用してDBには保存しない)
|Column|Type|Options|
|------|----|-------|
|name|string| |
### Association
has_many :products

## prefecturesテーブル (gem 'active_hash'を使用してDBには保存しない)
|Column|Type|Options|
|------|----|-------|
|name|string| |
### Association
has_many :products
has_many :addresses

## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string| |
### Association
has_many :products

* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
* ...