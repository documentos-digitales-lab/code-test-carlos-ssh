class Product < ApplicationRecord
  has_many :invoice_items
  validates :product_id, presence: true
  validate :product_exists

  private

  def product_exists
    errors.add(:product_id, 'must be an existing product') unless Product.exists?(product_id)
  end
end
