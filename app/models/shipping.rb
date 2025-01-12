class Shipping < ApplicationRecord
  validates :post_code, presence: true
  validates :prefecture_id, presence: true
  validates :municipality, presence: true
  validates :house_number, presence: true
  validates :phone_number, presence: true

  belongs_to :purchase
end
