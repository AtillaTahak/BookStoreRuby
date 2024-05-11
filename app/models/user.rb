class User < ApplicationRecord
	has_many :cart_items, dependent: :destroy
	has_many :orders, dependent: :destroy
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }, uniqueness: true
	has_secure_password
end
