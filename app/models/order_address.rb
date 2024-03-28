class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :street, :building, :telephone_num, :item_id, :user_id, :token,:item_price

  with_options presence: true do
    validates :city, :street, :telephone_num, :item_id, :user_id, :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone_num, format: { with: /\A\d{10,11}\z/, message: "should be a half-width numeric value with 10 to 11 digits" }
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create( item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street: street, building: building, telephone_num: telephone_num, order_id: order.id)
  end
end