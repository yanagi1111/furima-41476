class Order < ApplicationRecord
  attr_accessor :token
  validates :token, presence: true

  has_one :shipping
end
