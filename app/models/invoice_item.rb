class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :product

  accepts_nested_attributes_for :product, allow_destroy: true
  validates :product, presence: true
end
