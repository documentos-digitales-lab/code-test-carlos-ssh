class Customer < ApplicationRecord
  attr_accessor :current_id

  validates :rfc, presence: true
  has_many :invoices

  def fetch_greeting_message
    begin
      raise "Customer ID not set" unless self.current_id.present?

      client = Net::HTTP.new("dummyjson.com", 443)
      client.use_ssl = true
      path = "/users/#{self.current_id}"
      response = client.get(path)

      raise "Request failed with status #{response.code}" unless response.is_a?(Net::HTTPSuccess)

      customer_data = JSON.parse(response.body)
      "Hi #{customer_data['firstName']} #{customer_data['lastName']}, welcome to the invoice form!"
    rescue StandardError => e
      "Error fetching greeting: #{e.message}"
    end
  end
end
