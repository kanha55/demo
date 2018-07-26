Rails.application.routes.draw do
  
resources :post do
  resources :comments
end
  get 'carts/index'
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
    
  
  
resources :products do
    resources :orders, only: [:show, :new, :create]
end
 resources :orders, only: [:destroy, :index]
  root 'products#index'
  resources :carts
  resources :post
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
