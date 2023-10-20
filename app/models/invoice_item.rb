class InvoiceItem < ApplicationRecord
  belongs_to :invoice

  def calculate_amount
    return nil if quantity.nil? || unit_price.nil?

    quantity * unit_price
  end
end
