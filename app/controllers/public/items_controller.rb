class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @items = Item.find(params[:id])
  end

end
