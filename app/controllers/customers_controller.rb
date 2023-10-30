class CustomersController < ApplicationController
  def new; end

  def show
    @customer = Customer.find(params[:id])
    @invoice = Invoice.new
    @invoice.invoice_items.build
    puts "@invoice.invoice_items: #{@invoice.invoice_items.inspect}"
  end

  def create
    @customer = Customer.create(rfc: 'AAA')
    redirect_to customer_path(@customer)
  end

  def update
    Customer.find(params[:id])
    redirect_to new_customer_path
  end
end
