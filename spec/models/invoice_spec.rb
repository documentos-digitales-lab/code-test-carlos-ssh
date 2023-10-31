require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'relationships' do
    it { should belong_to :customer }
    it { should have_many :invoice_items }
  end

  describe 'New invoice' do
    it 'can create a new invoice' do
      customer = Customer.create!(rfc: 'AAA')
      invoice = customer.invoices.create!(customer_id: 1, sub_total: 200, tax: 16, total: 1200)

      expect(invoice.created_at?).to eq(true)
      expect(invoice.customer_id).to_not eq(nil)
      expect(invoice.sub_total).to_not eq(nil)
      expect(invoice.tax).to_not eq(nil)
      expect(invoice.total).to_not eq(nil)

      expect(invoice.customer_id).to_not eq('text')
      expect(invoice.sub_total).to_not eq('text')
      expect(invoice.tax).to_not eq('text')
      expect(invoice.total).to_not eq('text')
    end
  end
end
