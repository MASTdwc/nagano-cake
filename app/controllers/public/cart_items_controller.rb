class Public::CartItemsController < ApplicationController
    def index
      @cart_items=current_customer.cart_items
      @total_price =current_customer.cart_items.cart_items_total_price(@cart_items)
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
      @cart_item=current_customer.cart_items.new(cart_item_params)
      if cart_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
        cart_item=current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
        cart_item.amount+=params[:cart_item][:amount].to_i
        cart_items.save
        redirect_to cart_items_path
       elsif @cart_item.save
         @cart_items=current_customer.cart_items.all
         render 'index'
       else
         render 'index'
       end    
    end

private
    def cart_item_params
      params.require(:cart_item).permit(:amount, :item_id,:price)
    end
end
