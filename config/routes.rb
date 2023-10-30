Rails.application.routes.draw do
  resources :customers
  resources :invoices
  # resources :products
  resources :products, only: [:show]

  resources :invoice_items

  root "customers#new"

  post "/customers/:customer_id/invoices", to: "invoices#create"
  post "/invoices/:invoice_id/invoice_items", to: "invoice_items#create"
end
