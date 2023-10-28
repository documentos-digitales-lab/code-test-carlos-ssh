class InvoiceItem < ApplicationRecord
  before_validation :calculate_amount, on: [:create, :update]

  validates :quantity,
    presence: true,
    numericality: { greater_than: 0 }

    validates :name,
      presence: true

  validates :unit_price,
    presence: true,
    numericality: { greater_than: 0 }

  validates :amount,
    presence: true,
    numericality: { greater_than_or_equal_to: 0 }


  belongs_to :invoice

  private

  def amount
    quantity * unit_price
  end
end
