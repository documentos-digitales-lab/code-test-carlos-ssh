class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def create
    @customer = Customer.find(params[:invoice][:customer_id])
    @invoice = @customer.invoices.build(invoice_params)
    format_values
    if @invoice.save
      redirect_to invoice_path(@invoice), notice: 'Invoice was successfully created.'
    else
      render :new
    end
  end

  def new
    @invoice = Invoice.new
  end

  private

  def invoice_params
    params.require(:invoice).permit(:customer_id, :sub_total, :tax, :total)
  end

  def format_values
    @invoice.sub_total = params.require(:invoice)[:sub_total].to_f
    @invoice.tax = params.require(:invoice)[:tax].to_f
    @invoice.total = params.require(:invoice)[:total].to_f
  end
end
