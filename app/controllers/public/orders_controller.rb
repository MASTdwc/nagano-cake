class Public::OrdersController < ApplicationController
<<<<<<< HEAD
 before_action :authenticate_customer!
=======

>>>>>>> origin/develop

  def new
    @order=Order.new
    @customer=current_customer
    @addresses=@customer.addresses
  end

  def confirm
     @order=Order.new(order_params)
<<<<<<< HEAD
=======
      binding.pry

>>>>>>> origin/develop


    if params[:order][:select_address]=='0'
      @order.postal_code=current_customer.postcode
      @order.name=current_customer.last_name+current_customer.first_name
      @order.address=current_customer.address
    elsif params[:order][:select_address]=='1'
      @address=Address.find(params[:order][:address_id])
      @order.post_code=@address.postal_code
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

<<<<<<< HEAD
  def create
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    if @order.save
      @cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.order_id = @order.id
        order_detail.item_id = cart_item.item_id
        order_detail.amount = cart_item.amount
        order_detail.price = cart_item.item.price
        order_detail.save
      end
      redirect_to order_path
      @cart_items.destroy_all

    else
      @order = Order.new(order_params)
      render :new
    end
  end





=======
>>>>>>> origin/develop
  private

    def order_params
        params.require(:order).permit(:shipping_cost, :payment_method, :name, :address, :postal_code ,:customer_id,:total_payment, :status)
    end


end
