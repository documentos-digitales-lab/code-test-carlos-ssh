Rails.application.routes.draw do
  # resources :customers, only: [:new, :create, :show, :update]

  resources :customers do
    resources :invoices
  end

  resources :invoices do
    resources :invoice_items
  end

  resources :invoice_items do
    resources :items
  end

  root "customers#new"
end
