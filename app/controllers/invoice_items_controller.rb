class InvoiceItemsController < ApplicationController
  def index
    @quantity = params[:quantity]
    @unit_price = params[:unit_price]
  end

  def create
    @invoice_items = InvoiceItem.new(invoice_item_params)

    @amount = (@quantity.to_i * @unit_price.to_i).to_s if @quantity.present? && @unit_price.present?

    if @invoice_items.save
      flash[:notice] = 'Invoice Item was successfully created.'
    else
      flash[:alert] = 'Failed to create Invoice Item.'
    end

    render :new
  end

  def new
    @invoice_items = InvoiceItem.new
    @invoice_items.unit_price = 0.00
    @invoice_items.invoice_items.build
  end

  private

  def invoice_item_params
    params.require(:invoice_item).permit(:quantity, :name, :unit_price, :amount)
  end

  def multiply_items
    :quantity.value * :unit_price.value
  end
end
