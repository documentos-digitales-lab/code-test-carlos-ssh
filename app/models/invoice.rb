class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :invoice_items, -> { order(quantity: :desc) }

  validates_length_of :invoice_items, maximum: 2

  accepts_nested_attributes_for :invoice_items, allow_destroy: true, reject_if: :all_blank
end
