Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :invoices
  resources :senders
  resources :banks

  root :to => 'invoices#index'
end
