Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins

  namespace :admin do


     root to: 'public/homes#top'
     resources :items, only: [:index, :new, :create, :show, :edit, :update]
     resources :genres, only: [:index, :create, :edit, :update]
     resources :items, only: [:index, :new, :create, :show, :edit, :update]
     resources :customers, only: [:index, :show, :edit, :update]
  

  end
  
  devise_for :customers,skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
  } 
 




  scope module: :public do
    

     
    
     
     resources :orders, only: [:new, :index, :create, :show]
     post "orders/check"=>"orders#check",as:"check"
     get "orders/over"=>"orders#over",as:"over"
    
     resources :cart_items, only: [:index, :update, :destroy, :create]
     delete "cart_items/destroy_all"=>"cart_items#destroy_all",as:"destroy_all"
     

     get "customers/show" => "customers#show", as:"my_page"
     get "customers/edit" => "customers#edit", as:"info_edit"
     patch "customers/update" => "customers#update", as:"info"
     get "customers/unsubscribe" => "customers#unsubscribe", as:"unsubscribe"
     patch "customers/withdrawal" => "customers#withdrawal", as:"withdrawal"
  
    
    
    
    
    
    
    
    


  end
  
  




  
  
 
  
  
  
  
  
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


