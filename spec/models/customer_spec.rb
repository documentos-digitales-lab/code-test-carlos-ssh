require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) { create(:customer) }

  describe 'Validations' do
    it { should validate_presence_of :rfc }
  end

  describe 'Relationships' do
    it { should have_many :invoices }
  end

  it "is valid with valid attributes" do
    customer = Customer.new(rfc: 'AAA')
    expect(customer).to be_valid
  end

  it "is not valid without an RFC" do
    customer = Customer.new
    expect(customer).not_to be_valid
    expect(customer.errors[:rfc]).to include("can't be blank")
  end

  it "is not valid with an RFC of incorrect length" do
    customer = Customer.new(rfc: 'A')
    expect(customer).not_to be_valid
    expect(customer.errors.messages[:rfc]).to include("is too short (minimum is 3 characters)")
  end

end
