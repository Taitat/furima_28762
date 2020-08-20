Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:new, :create, :show, :edit]
  get 'items/account', to: 'items#account'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  devise_scope :user do
    get 'users', to: 'devise/registrations#new'
  end
  

end
