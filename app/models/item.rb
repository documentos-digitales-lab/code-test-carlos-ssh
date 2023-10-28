class Item < ApplicationRecord
  validates_presence_of :name, :description
  validates :unit_price,
    presence: true,
    numericality: { greather_than: 0 }
  has_many :invoice_items
  has_many :invoices,       through: :invoice_items

  def self.top_items_by_revenue(limit)
    joins(:transactions)
      .select('items.*, sum(invoice_items.quantity * invoice_items.unit_price) as revenue')
      .merge(Transaction.successful)
      .group(:id)
      .order('revenue DESC')
      .limit(limit)
  end

  def self.top_items_by_quantity_sold(limit)
    joins(:transactions)
      .select('items.*, sum(invoice_items.quantity) as quantity')
      .merge(Transaction.successful)
      .group(:id)
      .order('quantity DESC')
      .limit(limit)
  end
end
