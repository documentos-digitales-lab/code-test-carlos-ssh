class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :invoice_items, dependent: :destroy, inverse_of: :invoice
  accepts_nested_attributes_for :invoice_items, allow_destroy: true, reject_if: :all_blank
end
