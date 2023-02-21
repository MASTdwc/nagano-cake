class Public::CartItemsController < ApplicationController
    def index
      @cart_items=current_customer,cart_items
      @total_price =current_customer.cart_products.cart_products_total_price(@cart_products)
    end
    
    def update
      @cacrt_item = CartItem.find(params[:id])
      if params[:cart_item]
    end
    
    def destroy
    end
    
    def destroy_all
    end
    
    def create
    end
    
end
