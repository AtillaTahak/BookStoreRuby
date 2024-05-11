class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  validates :status, presence: true, inclusion: { in: %w[pending processing shipped completed] }
  validates :total_price, presence: true, numericality: { greater_than: 0 }
end
