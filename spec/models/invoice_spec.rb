require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'relationships' do
    it { should belong_to :customer }
    it { should have_many :invoice_items }
  end

  describe 'New invoice' do
    it 'can create a new invoice' do
      customer = Customer.create!(rfc: 'AAA')
      invoice = customer.invoices.create!(customer_id: 1, subtotal: 200, tax: 16, total: 1200)

      expect(invoice.created_at?).to eq(true)
      expect(invoice.customer_id).to_not eq(nil)
      expect(invoice.subtotal).to_not eq(nil)
      expect(invoice.tax).to_not eq(nil)
      expect(invoice.total).to_not eq(nil)

      expect(invoice.customer_id).to_not eq('text')
      expect(invoice.subtotal).to_not eq('text')
      expect(invoice.tax).to_not eq('text')
      expect(invoice.total).to_not eq('text')
    end
  end

  describe 'validations' do
    it 'should not be valid if it has more than 2 invoice items' do
      invoice = Invoice.new(customer_id: 1)
      invoice.invoice_items.build(product_id: 1, quantity: 2)
      invoice.invoice_items.build(product_id: 2, quantity: 1)
      invoice.invoice_items.build(product_id: 3, quantity: 1)

      expect(invoice).not_to be_valid
    end
  end
end
