class Book < ApplicationRecord
	has_many :cart_items
	has_many :order_items
	validates :title, presence: true
	validates :author, presence: true
	validates :price, presence: true, numericality: { only_integer: false, greater_than: 0 }
end
