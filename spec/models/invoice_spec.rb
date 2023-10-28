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
    end
  end
end
