class OrderForm
  include ActiveModel::Model

  attr_accessor :token, :post_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number

  validates :token, presence: true
  validates :post_code, presence: true
  validates :prefecture_id, presence: true
  validates :municipality, presence: true
  validates :house_number, presence: true
  validates :phone_number, presence: true

  def save
    Order.create(token: token)
    Shipping.create(genre: genre, post_code: post_code, prefecture_id: prefecture_id, municipality: municipality,
                    house_number: house_number, building_name: building_name, phone_number: phone_number)
  end
end
