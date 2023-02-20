Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins

  root to: "public/homes#top"
  get '/about' => 'home#about', as: 'about'

  namespace :admin do
    root to: "homes#top"
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:indes, :show, :create]
    resources :order_details, only: [:update]
    resources :sessions, only: [:new, :create, :destroy]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  scope module: :public do
    resources :orders, only: [:new, :index, :create, :show]
    post "orders/check"=>"orders#check",as:"check"
    get "orders/over"=>"orders#over",as:"over"
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete "cart_items/destroy_all"=>"cart_items#destroy_all",as:"destroy_all"
    resources :items, only: [:index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    
    get "customers/show" => "customers#show", as:"my_page"
    get "customers/edit" => "customers#edit", as:"information/edit"
    patch "customers/update" => "customers#update", as:"information"
    get "customers/unsubscribe" => "customers#unsubscribe", as:"unsubscribe"
    patch "customers/withdraw" => "customers#withdraw", as:"withdraw"
    
    
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
