class Public::OrdersController < ApplicationController

  
  def new
    @order=Order.new
    @customer=current_customer
    @addresses=@customer.addresses
  end

  def confirm
     @order=Order.new(order_params)
  

    if params[:order][:select_address]=='0'
      @order.post_code=current_customer.postcode
      @order.name=current_customer.last_name+current_customer.first_name
      @order.address=current_customer.address
    elsif params[:order][:select_address]=='1'
      @address=Address.find(params[:order][:address_id])
      @order.post_code=@address.postcode
      @order.name=@address.name
      @order.address=@address.address
    elsif params[:order][:select_address]=='2'
      @order.customer_id=current_customer.id
    end
    @cart_items=current_customer.cart_items.all
    @total_price = CartItem.total_payment(current_customer)
    @order_new=Order.new
    # render :confirm
  end

  def index
  end

  def show
  end
  
  private
  
    def order_params
        params.require(:order).permit(:shipping_cost, :payment_method, :name, :address, :postal_code ,:customer_id,:total_payment,:making_status)
    end
  
  
end
