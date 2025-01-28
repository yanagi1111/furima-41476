class OrderForm
  include ActiveModel::Model

  attr_accessor :token, :item_id, :user_id, :order_id, :post_code, :prefecture_id, :municipality, :house_number, :building_name,
                :phone_number

  validates :token, presence: true
  validates :post_code, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :municipality, presence: true
  validates :house_number, presence: true
  validates :phone_number, presence: true

  with_options presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: '半角数字とハイフンを使用してください' } do
    validates :post_code
  end

  with_options presence: true, format: { with: /\A\d{10,11}\z/, message: '半角数字のみを使用してください' } do
    validates :phone_number
  end

  def save
    @order = Order.create(item_id: item_id, user_id: user_id)
    Shipping.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality,
                    house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order_id)
  end
end
