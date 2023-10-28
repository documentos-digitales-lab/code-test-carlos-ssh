class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def create
    @min_items = set_min_items
    @customer = Customer.find(params[:invoice][:customer_id])
    @invoice = @customer.invoices.build(invoice_params)

    if @invoice.save
      redirect_to invoice_path(@invoice), notice: 'Invoice was successfully created.'
    else
      render :new
    end
  end

  def new
    @invoice = Invoice.new
    @invoice.invoice_items.build
  end

  private

  def set_min_items
    session[:invoice_items] = 1
  end

  def invoice_params
    params.require(:invoice).permit(
      :customer_id,
      :sub_total,
      :tax,
      :total,
      invoice_items_attributes: %i[
        invoice_id
        quantity
        name
        total_price
        amount
        _destroy
      ]
    ).tap do |whitelisted|
      whitelisted[:sub_total] = whitelisted[:sub_total].to_f
      whitelisted[:tax] = whitelisted[:tax].to_f
      whitelisted[:total] = whitelisted[:total].to_f
    end
  end
end
