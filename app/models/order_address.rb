class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id ,:postal_code, :prefecture_id, :city, :address_line1,:address_line2, :phone_number

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Should be in the format XXX-XXXX" }
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :address_line1, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "is invalid. Only allows 10 to 11 digits." }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_line1: address_line1, address_line2: address_line2, phone_number: phone_number, order_id: order.id )
  end
end