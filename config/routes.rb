Rails.application.routes.draw do
  resources :invoices
  resources :senders
  resources :banks

  root :to => 'invoices#index'
end
