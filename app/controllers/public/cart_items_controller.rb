class Public::CartItemsController < ApplicationController
    def index
      @cart_items=current_customer.cart_items
      @total_price =current_customer.cart_products.cart_products_total_price(@cart_products)
    end
    
    def update
      @cart_item = CartItem.find(params[:id])
      if params[:cart_item][:amount] == "0"
        @cart_item.destroy
        redirect_to cart_items_path
      elsif @cart_item.update(amount: params[:cart_item][:amount])
        redirect_to cart_items_path
      else
        @cart_items = current_customer.cart_items
        @total_price = current_customer.cart_items.cart_items_total_price(@cart_items)
        render "index"
      end
    end
    
    def destroy
      current_customer.cart_items.find(params[:id]).destroy
      redirect_to cart_items_path
    end
    
    def destroy_all
      current_customer.cart_items.destroy_all
      redirect_to cart_items_path
    end
    # カート内商品データ追加
    def create
      if cart_items.find_by()
    end
    
    def params_cart_product
    params.require(:cart_item).permit(:amount, :item_id)
    end
end
