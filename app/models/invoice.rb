class Invoice < ApplicationRecord
  after_save :calculate_totals

  belongs_to :customer
  has_many :invoice_items

  delegate :unit_price, to: :product, prefix: false

  validates_length_of :invoice_items, maximum: 2
  accepts_nested_attributes_for :invoice_items, allow_destroy: true, reject_if: :all_blank, limit: 2

  def calculate_totals
    return if @calculating_totals

    begin
      @calculating_totals = true

      puts "Calculating totals for Invoice #{id}..."
      amounts = invoice_items.map { |item| (item.quantity || 0) * (item.product.unit_price || 0) }
      self.subtotal = amounts.sum
      self.tax = 0.16 * subtotal
      self.total = subtotal + tax
      save
      puts "Totals calculated: Subtotal=#{subtotal}, Tax=#{tax}, Total=#{total}"
    ensure
      @calculating_totals = false
    end
  end
end
