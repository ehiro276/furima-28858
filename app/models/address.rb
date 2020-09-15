class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :postcode, :prefecture_id, :city, :number, :telephone_number
  end
end
