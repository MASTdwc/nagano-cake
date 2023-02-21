class Admin::HomesController < ApplicationController
  #before_action :authenticate_admin!

  def top
    @order = Order.all.order(id: "DESC")
    @orders = @order.page(params[:page])
  end
end
