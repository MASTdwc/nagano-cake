Rails.application.routes.draw do
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/index'
    get 'orders/show'
  end
  
  
 
  resources :customers, only: [:index, :show, :edit, :update]
  
  
  
  resources :cart_items, only: [:index, :update, :destroy, :destroy_all,:create]
  get "cart_items/index"=>"cart_items#index",as
  post "cart_items/create"=>"cart_items#create",
  
  
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
