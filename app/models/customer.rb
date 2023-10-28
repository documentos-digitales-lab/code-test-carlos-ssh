class Customer < ApplicationRecord
  validates :rfc, presence: true
  has_many :invoices
  has_many :invoice_items, through: :invoice
end
