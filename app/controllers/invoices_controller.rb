class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def create
    @customer = Customer.find_by(rfc: params[:invoice][:rfc])
    @invoice = @customer.invoices.create(invoice_params)
    redirect_to invoices_path(@invoice)
  end

  private

  def invoice_params
    params.require(:invoice).permit(:rfc)
  end
end
