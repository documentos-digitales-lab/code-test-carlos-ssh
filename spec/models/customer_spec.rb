require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :rfc }
  end

  describe 'Relationships' do
    it { should have_many :invoices }
  end
end
