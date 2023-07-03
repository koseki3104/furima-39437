class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user

  has_one_attached :image 

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_duration

      validates :image, presence: true
      validates :product_name, presence: true, length: { maximum: 40 }
      validates :product_description, presence: true, length: { maximum: 1000 }
      validates :category_id, numericality: { other_than: 1 } 
      validates :condition_id, numericality: { other_than: 1 } 
      validates :shipping_cost_id, numericality: { other_than: 1 } 
      validates :prefecture_id, numericality: { other_than: 1 } 
      validates :shipping_duration_id, numericality: { other_than: 1 } 
      validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
      validates :user_id, presence: true
end