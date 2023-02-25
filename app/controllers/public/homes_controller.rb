class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @item = Item.all
  end

  def about
  end

end
