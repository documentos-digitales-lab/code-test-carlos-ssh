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

    if @invoice.save
      redirect_to root_path, notice: 'Invoice was successfully created.'
    else
      render :new
    end
  end

  def new
    @invoice = Invoice.new
  end

  private

  def invoice_params
    params.require(:invoice).permit(:sub_total, :tax, :total)
  end
end
