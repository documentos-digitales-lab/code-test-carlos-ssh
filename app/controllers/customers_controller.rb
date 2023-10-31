class CustomersController < ApplicationController
  def new; end

  def show
    @customer = Customer.find(params[:id])
    @invoice = Invoice.new
    @invoice.invoice_items.build
    @customer.current_id = @customer.id
    @greeting_message = @customer.fetch_greeting_message

    flash[:notice] = @greeting_message

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
