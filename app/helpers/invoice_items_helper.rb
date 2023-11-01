module InvoiceItemsHelper
  def dynamic_id(form_params)
    "#{form_params['id']}-#{SecureRandom.uuid}"
  end
end
