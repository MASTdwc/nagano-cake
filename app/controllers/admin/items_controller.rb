class Admin::ItemsController < ApplicationController
  def index
    @item = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(admin_item_params)
    if @item.save
      redirect_to admin_item_path(@item)
      flash[:notice] = "商品を追加しました。"
    else
      render :new
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @genre = @item.genre
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(admin_item_params)
      redirect_to admin_item_path(@item)
      flash[:notice] = "商品内容を更新しました。"
    else
      render :edit
    end
  end
  
  private
  
  def admin_item_params
    params.require(:item).permit(:name, :introduction,  :price, :is_active, :image, :genre_id)
  end
end





