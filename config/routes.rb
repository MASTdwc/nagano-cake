Rails.application.routes.draw do
 

  namespace :admin do


     root to: 'homes#top'
     resources :genres, only: [:index, :create, :edit, :update]

     
     resources :orders, only: [:new, :create, :show, :index]
     resources :order_details, only: [:update]
     resources :sessions, only: [:nuw, :create, :destroy,]
     

  
  
  
  
  
  
  
  
  end






  scope module: :public do
    

     resources :orders, only: [:new, :index, :create, :show]
     post "orders/check"=>"orders#check",as:"check"
     get "orders/over"=>"orders#over",as:"over"
    
    
    
    
    
    
    
    
    
    
    
    


  end



























  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
