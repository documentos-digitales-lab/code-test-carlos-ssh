class InvoicesController < ApplicationController
  before_action :set_customer, only: %i[new create]
  before_action :set_invoice, only: %i[show edit update destroy]

  def new
    @invoice = @customer.invoices.build
    @invoice.invoice_items.build
  end

  def show; end

  def create
    @invoice = @customer.invoices.build(invoice_params)

    if @invoice.save
      redirect_to invoice_path(@invoice), notice: 'Invoice was successfully created.'
    else
      flash[:alert] = @invoice.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:invoice][:customer_id]) if params[:invoice] && params[:invoice][:customer_id]
  end

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(
      :customer_id,
      :sub_total,
      :tax,
      :total,
      invoice_items_attributes: [
        :quantity,
        :product_id,
        :amount,
        :_destroy,
        { product_attributes: %i[
          name
          description
          unit_price
        ] }
      ]
    )
  end
end
