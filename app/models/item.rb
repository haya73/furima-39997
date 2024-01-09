class Item < ApplicationRecord
  belongs_to       :user 
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :delivery_day

  validates :image,       presence: true
  validates :item_name,   presence: true
  validates :description, presence: true
  validates :price,       presence: true, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9999999,
    only_integer: true }

  validates :category_id, :condition_id, :delivery_cost_id, :prefecture_id, :delivery_day_id, numericality: { other_than: 1 , message: "can't be blank"}

end
