class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city, :number
    validates :telephone_number, format: { with: /\A\d{10,11}\z/}
  end
end
