class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
