class OrderForm
  include ActiveModel::Model

  attr_accessor :token, :item_id, :user_id, :post_code, :prefecture_id, :municipality, :house_number, :building_name,
                :phone_number

  with_options presence: true do
    validates :token
    validates :post_code
    validates :municipality
    validates :house_number
    validates :phone_number
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: '半角数字とハイフンを使用してください' }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: '半角数字のみを使用してください' }
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Shipping.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality,
                    house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
