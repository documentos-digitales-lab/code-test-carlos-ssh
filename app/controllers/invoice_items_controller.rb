class InvoiceItemsController < ApplicationController
  def index
    @quantity = params[:quantity]
    @amount = params[:amount]
  end

  def create
    @invoice_item = InvoiceItem.new(invoice_item_params)

    if @invoice_item.save
      flash[:notice] = 'Invoice Item was successfully created.'
    else
      flash[:alert] = 'Failed to create Invoice Item.'
    end
  end

  def new
    @invoice_item = InvoiceItem.new
    @invoice_item.build_product
  end

  private

  def invoice_item_params
    params.require(:invoice_item).permit(
      :quantity,
      :amount,
      product_attributes: %i[name description unit_price]
    )
  end
end
