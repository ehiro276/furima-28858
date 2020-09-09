class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }

  validates :category_id, :condition_id, :cost_id, :area_id, :sendout_id, presence: true, numericality: { other_than: 1 }

  with_options presence: true do
    validates :image, :name, :info, :category_id, :condition_id, :cost_id, :area_id, :sendout_id
    with_options format: { with: /\A[0-9]+\z/ } do
      validates :price
    end
  end
end
