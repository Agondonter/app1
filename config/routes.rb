Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  
  devise_for :users, controllers: { registrations: "user_registrations" }
  resources :users
  # Renders comments a nested resource of products
  resources :products do
    resources :comments
  end

  post 'payments/create'

  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  get 'simple_pages/landing_page'
  post 'simple_pages/thank_you'
  root 'simple_pages#landing_page'

  resources :orders, only: [:index, :show, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
