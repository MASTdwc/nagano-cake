class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_detail = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    if @order.update(order_params)
      @order_details.update_all(making_status: 1) if @order.status == "payment_confirmation"
      # 注文ステータスが「入金確認」のとき、製作ステータスをすべて「製作待ち」に更新する
    redirect_to admin_order_path(@order)
    end

  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
