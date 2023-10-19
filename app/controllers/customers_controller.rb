class CustomersController < ApplicationController
  def new
    # @customer = Customer.new
    # if @customer
    #   redirect_to new_invoice_path
    # end
  end

  def show
    @customer = Customer.find(params[:id])
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
