Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins

  root to: "homes#top"
  get '/about' => 'home#about', as: 'about'

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :create]
    resources :order_details, only: [:update]
    resources :sessions, only: [:new, :create, :destroy]
  end

  scope module: :public do
    resources :orders, only: [:new, :index, :create, :show]
    post "orders/check"=>"orders#check",as:"check"
    get "orders/over"=>"orders#over",as:"over"
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete "cart_items/destroy_all"=>"cart_items#destroy_all",as:"destroy_all"
    resources :items, only: [:index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
