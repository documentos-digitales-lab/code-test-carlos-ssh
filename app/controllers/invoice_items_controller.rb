class InvoiceItemsController < ApplicationController
  def new
    @invoice_items = InvoiceItem.new
    @invoice_items.produts.build
  end
end
