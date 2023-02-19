Rails.application.routes.draw do
 

  namespace :admin do


     root to: 'homes#top'
     resources :genres, only: [:index, :create, :edit, :update]
     


     resources :customers, only: [:index, :show, :edit, :update]
  
  
  
  
  
  
  
  
  
  end





  scope module: :public do
    

     resources :orders, only: [:new, :index, :create, :show]
     post "orders/check"=>"orders#check",as:"check"
     get "orders/over"=>"orders#over",as:"over"
    
     resources :cart_items, only: [:index, :update, :destroy, :create]
     delete "cart_items/destroy_all"=>"cart_items#destroy_all",as:"destroy_all"
     
  
  
    
    
    
    
    
    
    
    


  end





  
  
 
  
  
  
  
  
  
  
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
