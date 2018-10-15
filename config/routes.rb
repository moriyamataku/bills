Rails.application.routes.draw do
  resources :invoices
  resources :senders

  root :to => 'invoices#index'
end
