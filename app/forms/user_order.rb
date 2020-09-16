class UserOrder

  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :number, :building, :telephone_number, :user_id, :item_id, :card_token

  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city, :number
    validates :telephone_number, format: { with: /\A\d{10,11}\z/}
    validates :user_id, :item_id, :card_token
  end

  def save
    one_order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, number: number, building: building, telephone_number: telephone_number, order_id: one_order.id)
  end

  
end